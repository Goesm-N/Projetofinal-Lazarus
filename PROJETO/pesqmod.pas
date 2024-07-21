unit PesqMod;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, DBCtrls, DBGrids;

type

  { TPesqModF }

  TPesqModF = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    dsPesqMod: TDataSource;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  PesqModF: TPesqModF;

implementation

{$R *.lfm}

{ TPesqModF }

procedure TPesqModF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:= caFree;
end;

end.

