unit SelProd;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls;

type

  { TSelProd }

  TSelProd = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
  private

  public

  end;

var
  SelProd: TSelProd;

implementation

{$R *.lfm}

end.

