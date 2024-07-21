unit CadModelo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  ComCtrls, StdCtrls, DBGrids, DBCtrls, ZDataset;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    BtnNOVO: TButton;
    BtnFECHAR: TButton;
    BtnPESQUISA: TButton;
    BtnINSERIR: TButton;
    BtnEXCLUIR: TButton;
    BtnCANCELAR: TButton;
    dsCadModelo: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    gbCadModelo: TGroupBox;
    Label1: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    tbPesquisa: TTabSheet;
    tbCadastro: TTabSheet;
    procedure BtnCANCELARClick(Sender: TObject);
    procedure BtnEXCLUIRClick(Sender: TObject);
    procedure BtnFECHARClick(Sender: TObject);
    procedure BtnINSERIRClick(Sender: TObject);
    procedure BtnNOVOClick(Sender: TObject);
    procedure BtnPESQUISAClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  CadModeloF: TCadModeloF;

implementation

{$R *.lfm}

{ TCadModeloF }


procedure TCadModeloF.BtnFECHARClick(Sender: TObject);
begin
  Close;
end;

procedure TCadModeloF.BtnEXCLUIRClick(Sender: TObject);
begin

end;

procedure TCadModeloF.BtnCANCELARClick(Sender: TObject);
begin

end;

procedure TCadModeloF.BtnINSERIRClick(Sender: TObject);
begin

end;

procedure TCadModeloF.BtnNOVOClick(Sender: TObject);
begin

end;

procedure TCadModeloF.BtnPESQUISAClick(Sender: TObject);
begin

end;

procedure TCadModeloF.DBGrid1DblClick(Sender: TObject);
begin
    PageControl1.ActivePage := tbCadastro;
end;

procedure TCadModeloF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:= caFree;
end;

procedure TCadModeloF.FormShow(Sender: TObject);
begin
  //qryCatProd.Open;  <- QUERY ATUAL
  PageControl1.ActivePage := tbPesquisa;
end;

end.

