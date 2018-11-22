program sbcx53;

uses
  Forms,
  UMainQuery in 'UMainQuery.pas' {Main_Form},
  udm in 'udm.pas' {DM: TDataModule},
  UGroupBIn in 'UGroupBIn.pas' {GroupBIn_Form},
  UProItem in 'UProItem.pas' {Item_Form},
  UOut in 'UOut.pas' {FormOut},
  UST in 'UST.pas' {St_Form},
  UChange in 'UChange.pas' {frmChange},
  PasOutCollectQuery in 'PasOutCollectQuery.pas' {FrmOutCollectQuery},
  PasInCollectQuery in 'PasInCollectQuery.pas' {FrmInCollectQuery};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产成品进出存查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_Form, Main_Form);
  Application.Run;
end.
