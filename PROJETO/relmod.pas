unit RelMod;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  LR_DBSet, LR_Class, DB, DM;

type

  { TRelModF }

  TRelModF = class(TForm)
    Button1: TButton;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qryRelCli: TZQuery;
    qryRelCliclienteid: TLongintField;
    qryRelClicpf_cnpj_cliente: TStringField;
    qryRelClinome_cliente: TStringField;
    qryRelClitipo_cliente: TStringField;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  RelModF: TRelModF;

implementation

{$R *.lfm}

{ TRelModF }

procedure TRelModF.FormShow(Sender: TObject);
begin
  qryRelCli.Open;
  frReport1.LoadFromFile('RelCliente.lrf');
  frReport1.PrepareReport;
  frReport1.ShowReport;
end;


end.

