unit pesqcliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, PesqMod, DBCtrls, DB;

type

  { TPesqClienteF }

  TPesqClienteF = class(TPesqModF)
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  PesqClienteF: TPesqClienteF;

implementation
uses
  Orcamentos,DM;

{$R *.lfm}

{ TPesqClienteF }

procedure TPesqClienteF.Button1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('Insira um ID');
  end
  else
  DMF.qryClientes.Close;
  DMF.qryClientes.SQL.Clear;
  DMF.qryClientes.SQL.Text:= 'SELECT * FROM CLIENTE' +
                             ' WHERE CLIENTEID = ' + QuotedStr(Edit1.Text) +
                             ' ORDER BY CLIENTEID';
  DMF.qryClientes.Open;
end;

procedure TPesqClienteF.DBGrid1DblClick(Sender: TObject);
begin
  OrcamentosF.DBEdit2.Text:= DMF.qryClientesclienteid.AsString;
  OrcamentosF.Edit2.Text:= DMF.qryClientesnome_cliente.AsString;

  Close;
end;

procedure TPesqClienteF.DBNavigator1Click(Sender: TObject;
  Button: TDBNavButtonType);
begin
  DMF.qryClientes.Close;
  DMF.qryClientes.SQL.Clear;
  DMF.qryClientes.SQL.Text:= 'select * from cliente';
  DMF.qryClientes.Open;
  Edit1.Text:= '';
end;

procedure TPesqClienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction:= caFree;
end;

end.

