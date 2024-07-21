program prjPROJETO;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, zcomponent, CadModelo, DM, MenuPrincipal,
  CadClientes, CadProdutos, CadUsuarios, PesqCat, cadcategoria, Sobre, 
Orcamentos, PesqMod, pesqcliente, unit1;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDMF, DMF);
  Application.CreateForm(TMenuPrincipalF, MenuPrincipalF);
  Application.CreateForm(TCadModeloF, CadModeloF);
  Application.CreateForm(TPesqCatF, PesqCatF);
  Application.CreateForm(TPesqModF, PesqModF);
  Application.CreateForm(TPesqClienteF, PesqClienteF);
  Application.Run;
end.

