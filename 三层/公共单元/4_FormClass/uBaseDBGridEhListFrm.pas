unit uBaseDBGridEhListFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, Vcl.XPMan, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmBaseDBGridEhList = class(TfrmBase)
    cdsMain: TClientDataSet;
    dsMain: TDataSource;
    pnlMain: TPanel;
    pnlDisplayMain: TPanel;
    pnlChildMain: TPanel;
    pnlEhMainDisplay: TPanel;
    ehMain: TDBGridEh;
    procedure ehMainTitleClick(Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData;virtual;abstract;
  end;


implementation

{$R *.dfm}

{ TfrmBaseDBGridEhList }


procedure TfrmBaseDBGridEhList.ehMainTitleClick(Column: TColumnEh);
var
  LOP: TIndexOptions;
begin
  inherited;
  if cdsMain.State = dsInactive then Exit;

  //lblFilter.Caption := Column.Title.Caption;
  //FHotColumn := Column;
  if not Column.Field.IsBlob then { 不能给大二进制字段建立索引或排序 }
  begin
    if column.Title.SortMarker =smDownEh then
    begin
     column.Title.SortMarker:=smUpEh;
     lop:=[];
    end else
    begin
     column.Title.SortMarker:=smDownEh;
     LOP := [ixDescending];
    end;
    cdsMain.IndexDefs.Update;
    if cdsMain.IndexDefs.IndexOf('MainDefIndex') >= 0 then
      cdsMain.DeleteIndex('MainDefIndex');
    cdsMain.AddIndex('MainDefIndex', Column.FieldName, LOP, '');
    cdsMain.IndexName := 'MainDefIndex';
  end;
end;

end.
