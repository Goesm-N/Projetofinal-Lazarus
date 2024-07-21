unit CadProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  Buttons, ComCtrls, CadModelo, DM, DB,
  PesqCat;

type

  { TCadProdutosF }

  TCadProdutosF = class(TCadModeloF)
    Button1: TButton;
    DBCbStatus: TDBComboBox;
    DBEdtID: TDBEdit;
    DBEdtObs: TDBEdit;
    DBEdtDs: TDBEdit;
    DBEdtVlVenda: TDBEdit;
    DBEdtDtCad: TDBEdit;
    DBEdtIDCat: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure BtnCANCELARClick(Sender: TObject);
    procedure BtnEXCLUIRClick(Sender: TObject);
    procedure BtnFECHARClick(Sender: TObject);
    procedure BtnINSERIRClick(Sender: TObject);
    procedure BtnNOVOClick(Sender: TObject);
    procedure BtnPESQUISAClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBCbStatusChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBNavigator2Click(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Label11Click(Sender: TObject);
  private

  public

  end;

var
  CadProdutosF: TCadProdutosF;

implementation

{$R *.lfm}

{ TCadProdutosF }

procedure TCadProdutosF.BtnCANCELARClick(Sender: TObject);
begin
    DMF.qryProdutos.Cancel;
   PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadProdutosF.BtnEXCLUIRClick(Sender: TObject);
begin
    If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
      DMF.qryProdutos.delete;
      PageControl1.ActivePage := tbPesquisa;
  end;
end;

procedure TCadProdutosF.BtnFECHARClick(Sender: TObject);
begin
  Close;
end;

procedure TCadProdutosF.BtnINSERIRClick(Sender: TObject);
begin
  if (DBEdtIDCat.Text <> '') then
  begin
      if (DBEdtObs.Text <> '') then
      begin
          if (DBEdtDs.Text <> '') then
          begin
              if (DBEdtVlVenda.Text <> '') then
              begin
                  if (DBCbStatus.Text <> '') then
                  begin
                      DMF.qryProdutos.Post;
                      PageControl1.ActivePage := tbPesquisa;
                  end
                  else
                  begin
                       ShowMessage('Indique o status do produto');
                       DBCbStatus.SetFocus;
                  end;
              end
              else
              begin
                   ShowMessage('Digite o valor de venda do produto');
                   DBEdtVlVenda.SetFocus;
              end;
          end
          else
          begin
               ShowMessage('Insira a descrição do produto');
               DBEdtDs.SetFocus;
          end;
      end
      else
      begin
           ShowMessage('Insira uma observação para o produto');
           DBEdtObs.SetFocus;
      end;
  end
  else
  begin
       ShowMessage('Selecione a Categoria do produto');
       DBEdtIDCat.SetFocus;
  end;
end;

procedure TCadProdutosF.BtnNOVOClick(Sender: TObject);
begin
     DMF.qryProdutos.Insert;
     PageControl1.ActivePage := tbCadastro;
     DBEdtDtCad.Text:= DateToStr(Date);
end;

procedure TCadProdutosF.BtnPESQUISAClick(Sender: TObject);
begin
     if Edit1.Text = '' then
    begin
        ShowMessage('indique uma descrição ');
        DMF.qryProdutos.Close;
        DMF.qryProdutos.Open;
    end
     else
     DMF.qryProdutos.Close;
     DMF.qryProdutos.SQL.Clear;
     DMF.qryProdutos.SQL.Text:= 'SELECT *' +
                                ' FROM PRODUTO' +
                                ' WHERE STATUS_PRODUTO = ' + QuotedStr(UpperCase('%' + Edit1.Text + '%'))  +
                                ' ORDER BY PRODUTOID';
     DMF.qryProdutos.Open;

end;

procedure TCadProdutosF.Button1Click(Sender: TObject);
begin
  PesqCatF:= TPesqCatF.Create(Self);
  PesqCatF.Show;

end;

procedure TCadProdutosF.DBCbStatusChange(Sender: TObject);
begin
  if DBCbStatus.Text = 'ATIVO.' then
  begin
      DBCbStatus.Font.Color := clGreen;
  end;
  if DBCbStatus.Text = 'INATIVO.' then
  begin
      DBCbStatus.Font.Color := clRed;
  end;
end;

procedure TCadProdutosF.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
end;

procedure TCadProdutosF.DBNavigator2Click(Sender: TObject;
  Button: TDBNavButtonType);
begin
  DMF.qryProdutos.Close;
  DMF.qryProdutos.SQL.Clear;
  DMF.qryProdutos.SQL.Text:= 'select * from produto';
  DMF.qryProdutos.Open;
  Edit1.Text:= '';
end;

procedure TCadProdutosF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  inherited;
end;

procedure TCadProdutosF.FormShow(Sender: TObject);
begin
  inherited;
end;

procedure TCadProdutosF.Label11Click(Sender: TObject);
begin

end;

end.

