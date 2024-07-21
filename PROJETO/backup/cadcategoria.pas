unit cadcategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  CadModelo, DB, DM;

type

  { TCadCategoriaF }

  TCadCategoriaF = class(TCadModeloF)
    ComboBox1: TComboBox;
    DBEdtID: TDBEdit;
    DBEdtDS: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BtnCANCELARClick(Sender: TObject);
    procedure BtnEXCLUIRClick(Sender: TObject);
    procedure BtnFECHARClick(Sender: TObject);
    procedure BtnINSERIRClick(Sender: TObject);
    procedure BtnNOVOClick(Sender: TObject);
    procedure BtnPESQUISAClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBNavigator2Click(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  CadCategoriaF: TCadCategoriaF;

implementation

{$R *.lfm}

{ TCadCategoriaF }

procedure TCadCategoriaF.BtnCANCELARClick(Sender: TObject);
begin
   DMF.qryCategoria.Cancel;
   PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadCategoriaF.BtnEXCLUIRClick(Sender: TObject);
begin
    If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
  DMF.qryCategoria.delete;
      PageControl1.ActivePage := tbPesquisa;
  end;
end;

procedure TCadCategoriaF.BtnFECHARClick(Sender: TObject);
begin
  inherited;
end;

procedure TCadCategoriaF.BtnINSERIRClick(Sender: TObject);
begin
  if DBEdtDS.Text = '' then
    begin
        ShowMessage('Insira uma descrição');
        DMF.qryCategoria.Cancel;
        PageControl1.ActivePage:= tbCadastro;
    end
    else
     DMF.qryCategoria.Post;
     PageControl1.ActivePage := tbPesquisa;;
  end;

procedure TCadCategoriaF.BtnNOVOClick(Sender: TObject);
begin
   DMF.qryCategoria.Insert;
  PageControl1.ActivePage := tbCadastro;

  if DBEdtDS.CanFocus then
    begin
     DBEdtDS.SetFocus;
    end;
end;

procedure TCadCategoriaF.BtnPESQUISAClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
     ShowMessage('Insira um valor');
     DMF.qryCategoria.Open;
  end;
  if Edit1.Text <> '' then
  begin
     if ComboBox1.Text = 'ID.' then
       begin
            DMF.qryCategoria.Close;
            DMF.qryCategoria.SQL.Clear;
            DMF.qryCategoria.SQL.Text:= 'SELECT *'+
                                        ' FROM CATEGORIA_PRODUTO'+
                                        ' WHERE CATEGORIAPRODUTOID = ' + QuotedStr(Edit1.Text);
            DMF.qryCategoria.Open;
       end;
     if ComboBox1.Text = 'Descrição.'then
       begin
          DMF.qryCategoria.Close;
          DMF.qryCategoria.SQL.Clear;
          DMF.qryCategoria.SQL.Text:= 'SELECT *'+
                                      ' FROM CATEGORIA_PRODUTO'+
                                      ' WHERE DS_CATEGORIA_PRODUTO like ' +QuotedStr(UpperCase('%' + Edit1.Text + '%')) +
                                      ' ORDER BY DS_CATEGORIA_PRODUTO';
          DMF.qryCategoria.Open;
       end;
     if ComboBox1.Text = '' then
       begin
          ShowMessage('Escolha um modo de pesquisa');
          ComboBox1.SetFocus;
       end;
  end;
end;

procedure TCadCategoriaF.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.Text = 'ID.' then
    begin
       Edit1.NumbersOnly:= true;
       Edit1.Text:= '';
    end
    else
    Edit1.NumbersOnly:= false;
    Edit1.Text:= '';
end;

procedure TCadCategoriaF.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
end;

procedure TCadCategoriaF.DBNavigator2Click(Sender: TObject;
  Button: TDBNavButtonType);
begin
  DMF.qryCategoria.Close;
  DMF.qryCategoria.SQL.Clear;
  DMF.qryCategoria.SQL.Text:= 'select * from categoria_produto';
  DMF.qryCategoria.Open;
  Edit1.Text:= '';
end;

procedure TCadCategoriaF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  inherited;
end;

procedure TCadCategoriaF.FormShow(Sender: TObject);
begin
  inherited;
end;

end.

