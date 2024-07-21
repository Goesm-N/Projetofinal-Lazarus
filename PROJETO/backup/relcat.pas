unit RelCat;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  LR_Class, LR_DBSet;

type

  { TRelCatF }

  TRelCatF = class(TForm)
    Button1: TButton;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qryRelCat: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  RelCatF: TRelCatF;

implementation

{$R *.lfm}

{ TRelCatF }

procedure TRelCatF.FormShow(Sender: TObject);
begin
  qryRelCat.Open;
  frReport1.LoadFromFile('RelCat.lrf');
  frReport1.PrepareReport;
  frReport1.ShowReport;
end;

procedure TRelCatF.FormCreate(Sender: TObject);
begin

end;

end.

