unit CadClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  CadModelo, DB, DM;

type
  { TCadClientesF }

  TCadClientesF = class(TCadModeloF)
    ComboBox1: TComboBox;
    DBCbTCliente: TDBComboBox;
    DBEdtID: TDBEdit;
    DBEdtCPF: TDBEdit;
    DBEdtNome: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure BtnCANCELARClick(Sender: TObject);
    procedure BtnEXCLUIRClick(Sender: TObject);
    procedure BtnFECHARClick(Sender: TObject);
    procedure BtnINSERIRClick(Sender: TObject);
    procedure BtnNOVOClick(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBCbTClienteChange(Sender: TObject);
    procedure DBNavigator2Click(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  CadClientesF: TCadClientesF;

implementation

{$R *.lfm}

{ TCadClientesF }

procedure TCadClientesF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction );
begin
  inherited;
end;

procedure TCadClientesF.BtnFECHARClick(Sender: TObject);
begin
  inherited;
end;

procedure TCadClientesF.BtnEXCLUIRClick(Sender: TObject);
begin
    If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
      DMF.qryClientes.delete;
      PageControl1.ActivePage := tbPesquisa;
  end;
end;

procedure TCadClientesF.BtnCANCELARClick(Sender: TObject);
begin
  begin
   DMF.qryClientes.Cancel;
   PageControl1.ActivePage := tbPesquisa;
  end;

end;

procedure TCadClientesF.BtnINSERIRClick(Sender: TObject);
begin
  if (DBCbTCliente.Text <> '') then
    begin
       if (DBEdtCPF.Text <> '') then
         begin
            If (DBEdtNome.Text <> '') then
              begin
                    DMF.qryClientes.Post;
                    PageControl1.ActivePage := tbPesquisa
              end
              else
              begin
                   ShowMessage('Insira o nome do cliente');
                   DBEdtNome.SetFocus;
              end;
         end
         else
         begin
              ShowMessage('Digite o Cpf ou Cnpj do cliente');
              DBEdtCPF.SetFocus;
         end;
    end
    else
    begin
         ShowMessage('Selecione o tipo de cliente');
         DBCbTCliente.SetFocus;
    end;
end;

procedure TCadClientesF.BtnNOVOClick(Sender: TObject);
begin
  DMF.qryClientes.Insert;
  PageControl1.ActivePage:= tbCadastro;
end;

procedure TCadClientesF.BtnPesquisaClick(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
        ShowMessage('insira um valor');
        DMF.qryClientes.Open;
    end;
  if Edit1.Text <> '' then
    begin
       if ComboBox1.Text = 'CPF/CNPJ.' then
         begin
            DMF.qryClientes.Close;
            DMF.qryClientes.SQL.Clear;
            DMF.qryClientes.SQL.Text:= 'SELECT * FROM CLIENTE' +
                                       ' WHERE CPF_CNPJ_CLIENTE like' +QuotedStr('%' + Edit1.Text + '%') +
                                       ' ORDER BY CLIENTEID';
            DMF.qryClientes.Open;
         end;
       if ComboBox1.Text = 'NOME.' then
         begin
            DMF.qryClientes.Close;
            DMF.qryClientes.SQL.Clear;
            DMF.qryClientes.SQL.Text:= 'SELECT * FROM CLIENTE' +
                                       ' WHERE NOME_CLIENTE like' +QuotedStr('%' + Edit1.Text + '%') +
                                       ' ORDER BY CLIENTEID';
            DMF.qryClientes.Open;
         end;
       if ComboBox1.Text = 'ID.' then
         begin
            DMF.qryClientes.Close;
            DMF.qryClientes.SQL.Clear;
            DMF.qryClientes.SQL.Text:= 'SELECT * FROM CLIENTE' +
                                       ' WHERE CLIENTEID = ' + QuotedStr(Edit1.Text) +
                                       ' ORDER BY CLIENTEID';
            DMF.qryClientes.Open;
         end;
       if ComboBox1.Text = '' then
         begin
            ShowMessage('Escolha um mode de pesquisa');
            ComboBox1.SetFocus;
         end;
    end;
end;

procedure TCadClientesF.FormShow(Sender: TObject);
begin
  DMF.qryClientes.Open;
  PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadClientesF.Button1Click(Sender: TObject);
begin
    DMF.qryClientes.Insert;
  PageControl1.ActivePage := tbCadastro;

   if DBEdtNome.CanFocus then
     DBEdtNome.SetFocus;
end;

procedure TCadClientesF.Button4Click(Sender: TObject);
begin
    If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
      DMF.qryClientes.delete;
      PageControl1.ActivePage := tbPesquisa;
  end
end;

procedure TCadClientesF.Button5Click(Sender: TObject);
begin
  DMF.qryClientes.Cancel;
  PageControl1.ActivePage:= tbPesquisa;
end;

procedure TCadClientesF.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.Text = 'CPF/CNPJ.' then
    begin
       Edit1.Text:= '';
       Edit1.NumbersOnly:= False;
       Edit1.TextHint:= 'Digite o CPF/CNPJ do cliente';
    end;
    if ComboBox1.Text = 'NOME.' then
      begin
           Edit1.Text:= '';
           Edit1.NumbersOnly:= False;
           Edit1.TextHint:= 'Digite o Nome do cliente';
      end;
    If ComboBox1.Text = 'ID.' then
      begin
           Edit1.Text:= '';
           Edit1.NumbersOnly:= True;
           Edit1.TextHint:= 'Insira o ID do cliente';
      end;
end;

procedure TCadClientesF.DBCbTClienteChange(Sender: TObject);
begin
  if DBCbTCliente.Text = 'F' then
    begin
       DBEdtCPF.Field.EditMask:= '000.000.000\-00';
    end;
  if DBCbTCliente.Text = 'J' then
    begin
       DBEdtCPF.Field.EditMask:= '00.000.000/0000-00';
    end;
end;

procedure TCadClientesF.DBNavigator2Click(Sender: TObject;
  Button: TDBNavButtonType);
begin
  DMF.qryClientes.Close;
  DMF.qryClientes.SQL.Clear;
  DMF.qryClientes.SQL.Text:= 'select * from cliente';
  DMF.qryClientes.Open;
  Edit1.Text:= '';
end;



end.

