unit CadUsuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  CadModelo, DB, DM;

type

  { TCadUsuariosF }

  TCadUsuariosF = class(TCadModeloF)
    DBEdtID: TDBEdit;
    DBEdtUsuario: TDBEdit;
    DBEdtNome: TDBEdit;
    DBEdtSenha: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure BtnCANCELARClick(Sender: TObject);
    procedure BtnEXCLUIRClick(Sender: TObject);
    procedure BtnFECHARClick(Sender: TObject);
    procedure BtnINSERIRClick(Sender: TObject);
    procedure BtnNOVOClick(Sender: TObject);
    procedure BtnPESQUISAClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBNavigator2Click(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  CadUsuariosF: TCadUsuariosF;

implementation

{$R *.lfm}

{ TCadUsuariosF }

procedure TCadUsuariosF.BtnCANCELARClick(Sender: TObject);
begin
   DMF.qryUsuarios.Cancel;
   PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadUsuariosF.BtnEXCLUIRClick(Sender: TObject);
begin
    If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
      DMF.qryUsuarios.delete;
      PageControl1.ActivePage := tbPesquisa;
  end;
end;

procedure TCadUsuariosF.BtnFECHARClick(Sender: TObject);
begin
  inherited;
end;

procedure TCadUsuariosF.BtnINSERIRClick(Sender: TObject);
begin
  if (DBEdtUsuario.Text <> '') then
   begin
       If (DBEdtNome.Text <> '') then
        begin
            if (DBEdtSenha.Text <> '') then
             begin
                 DMF.qryUsuarios.Post;
                 PageControl1.ActivePage := tbPesquisa;
             end
             else
             begin
               ShowMessage('Digite uma senha');
               DBEdtSenha.SetFocus;
             end;
        end
        else
        begin
          ShowMessage('Insira seu nome');
          DBEdtNome.SetFocus;
        end;
   end
   else
   begin
     ShowMessage('Insira o nome do usuário');
     DBEdtUsuario.SetFocus;
   end;
end;

procedure TCadUsuariosF.BtnNOVOClick(Sender: TObject);
begin
  DMF.qryUsuarios.Insert;
  PageControl1.ActivePage := tbCadastro;
    if DBEdtUsuario.CanFocus then
     DBEdtUsuario.SetFocus;
end;

procedure TCadUsuariosF.BtnPESQUISAClick(Sender: TObject);
begin
    if Edit1.Text = '' then
  begin
     ShowMessage('Insira um valor');
     DMF.qryUsuarios.Open;
  end
  else
      DMF.qryUsuarios.Close;
      DMF.qryUsuarios.SQL.Clear;
      DMF.qryUsuarios.SQL.Text:= 'SELECT *'+
                                  ' FROM USUARIOS'+
                                  ' WHERE ID = ' + QuotedStr(Edit1.Text);
      DMF.qryUsuarios.Open;

end;

procedure TCadUsuariosF.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
end;

procedure TCadUsuariosF.DBNavigator2Click(Sender: TObject;
  Button: TDBNavButtonType);
begin
  DMF.qryUsuarios.Close;
  DMF.qryUsuarios.SQL.Clear;
  DMF.qryUsuarios.SQL.Text:= 'select * from cliente';
  DMF.qryUsuarios.Open;
  Edit1.Text:= '';
end;

procedure TCadUsuariosF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  inherited;
end;

procedure TCadUsuariosF.FormShow(Sender: TObject);
begin
  inherited;
end;

end.

