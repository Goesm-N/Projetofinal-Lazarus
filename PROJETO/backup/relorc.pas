unit RelOrc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  LR_Class, LR_DBSet;

type

  { TRelOrcF }

  TRelOrcF = class(TForm)
    Button1: TButton;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qryRelOrc: TZQuery;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  RelOrcF: TRelOrcF;

implementation

{$R *.lfm}

{ TRelOrcF }

procedure TRelOrcF.FormShow(Sender: TObject);
begin
  qryRelOrc.Open;
  frReport1.LoadFromFile('RelOrc.lrf');
  frReport1.PrepareReport;
  frReport1.ShowReport;
end;

end.

