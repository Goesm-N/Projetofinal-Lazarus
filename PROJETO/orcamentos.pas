unit Orcamentos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, DBGrids,
  StdCtrls, ExtCtrls, Buttons, CadModelo, DB, pesqcliente, SelProd, DM;

type

  { TOrcamentosF }

  TOrcamentosF = class(TCadModeloF)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button3: TButton;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBGrid2: TDBGrid;
    dsOrcItem: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnCANCELARClick(Sender: TObject);
    procedure BtnEXCLUIRClick(Sender: TObject);
    procedure BtnFECHARClick(Sender: TObject);
    procedure BtnGRAVARClick(Sender: TObject);
    procedure BtnNOVOClick(Sender: TObject);
    procedure BtnPESQUISAClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  OrcamentosF: TOrcamentosF;

implementation

{$R *.lfm}

{ TOrcamentosF }


procedure TOrcamentosF.BtnCANCELARClick(Sender: TObject);
begin
  DMF.qryOrcamentos.Cancel;
  PageControl1.ActivePage:= tbPesquisa;
end;

procedure TOrcamentosF.BitBtn1Click(Sender: TObject);
  var id : String;
begin

   DMF.qryOrcItem.Insert;

   DMF.qryGenerica.close;
   DMF.qryGenerica.SQL.Clear;
   DMF.qryGenerica.SQL.Add('SELECT MAX(orcamentoitemid) + 1 PROXCODIGO '+
                                   'FROM orcamento_item');

   DMF.qryGenerica.Open;

   id := DMF.qryGenerica.FieldByName('PROXCODIGO').AsString;

   if id = '' then
      DMF.qryOrcItemorcamentoitemid.AsInteger := 1
   else
      DMF.qryOrcItemorcamentoitemid.AsInteger := StrToInt(id);

   DMF.qryOrcItemorcamentoid.AsInteger := DMF.qryOrcamentosorcamentoid.AsInteger;

  // CHAMAR Tela de inserir item
  SelProdF := TSelProdF.Create(Self);
  SelProdF.Show;


end;

procedure TOrcamentosF.BitBtn2Click(Sender: TObject);
begin
  DMF.qryOrcItem.Delete;
end;

procedure TOrcamentosF.BtnEXCLUIRClick(Sender: TObject);
begin
  If  MessageDlg('Deseja excluir o Orçamento?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
      DMF.qryOrcamentos.Delete;
      PageControl1.ActivePage:= tbPesquisa;
  end;
end;

procedure TOrcamentosF.BtnFECHARClick(Sender: TObject);
begin
  inherited;
end;

procedure TOrcamentosF.BtnGRAVARClick(Sender: TObject);
begin
  DMF.SomaItens;

  DMF.qryOrcamentos.Post;
  PageControl1.ActivePage:= tbPesquisa;
end;

procedure TOrcamentosF.BtnNOVOClick(Sender: TObject);
begin
  DMF.qryOrcamentos.Insert;
  PageControl1.ActivePage:= tbCadastro;

  DMF.qryOrcItem.Close;
  DMF.qryOrcItem.SQL.Clear;
  DMF.qryOrcItem.SQL.Text:= 'SELECT * ' +
                           ' FROM ORCAMENTO_ITEM ' +
                            ' WHERE orcamentoid = ' + QuotedStr(DBEdit1.Text);
  DMF.qryOrcItem.Open;

   DBEdit3.Text:= DateToStr(date);
   DBEdit4.Text:= DateToStr(Date + 15);

   DBEdit5.Text:= '0';  //valor total

  if DBEdit2.CanFocus then
     DBEdit2.SetFocus;
end;

procedure TOrcamentosF.BtnPESQUISAClick(Sender: TObject);
begin
  inherited;
end;

procedure TOrcamentosF.Button3Click(Sender: TObject);
begin
    PesqClienteF:= TPesqClienteF.Create(Self);
  PesqClienteF.Show;
end;

procedure TOrcamentosF.DBGrid1DblClick(Sender: TObject);
begin
  DBEdit1.Text:= DMF.qryOrcamentosorcamentoid.AsString;

  DMF.qryOrcItem.Close;
  DMF.qryOrcItem.SQL.Clear;
  DMF.qryOrcItem.SQL.Text:= 'SELECT * ' +
                           ' FROM ORCAMENTO_ITEM ' +
                            ' WHERE orcamentoid = ' + QuotedStr(DBEdit1.Text);
  DMF.qryOrcItem.Open;
  inherited;
end;

procedure TOrcamentosF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  inherited;
end;

procedure TOrcamentosF.FormShow(Sender: TObject);
begin
  DMF.qryOrcamentos.Open;
  inherited;
end;

end.

