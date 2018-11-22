unit DM_f;

interface

uses
  SysUtils, Classes,  SqlExpr, DB, DBClient, 
  ADODB, Provider,StrUtils;

type
  TDM = class(TDataModule)
    cdsRead: TClientDataSet;
    ADOConnection1: TADOConnection;
    dspRead: TDataSetProvider;
    cds0004: TClientDataSet;
    dt0004: TADODataSet;
    dsp0004: TDataSetProvider;
    dtRead1: TADODataSet;
    dtReadDate: TADODataSet;
    dspReadDate: TDataSetProvider;
    cdsReadDate: TClientDataSet;
    dtRead: TADODataSet;
    dspRead1: TDataSetProvider;
    cdsRead1: TClientDataSet;
    dtReadRkey: TADODataSet;
    qry0843_delete: TADOQuery;
    qry0843_deleteRkey: TAutoIncField;
    qry0843_deleteWork_ptr: TIntegerField;
    qry0843_deletestop_begin_date: TDateTimeField;
    qry0843_deletestop_end_date: TDateTimeField;
    qry0843_deleteremark: TWideStringField;
    qry0843ResultTime_delete: TADOQuery;
    cdsClone: TClientDataSet;
    cds0849_Delete: TClientDataSet;
    cds0849_DeleteD419_ptr: TIntegerField;
    cds0849_DeleteD073_ptr: TIntegerField;
    cds0849_DeleteFieldName: TStringField;
    cds0849_DeleteFieldOrder: TIntegerField;
    cds0849_DeleteFieldWidth: TIntegerField;
    cds0849_DeleteIsDisplay: TBooleanField;
    cds0849_DeleteGridName: TStringField;
    cds0849_DeleteFieldCaption: TStringField;
    dt0849_Delete: TADODataSet;
    dsp0849_Delete: TDataSetProvider;
    dt0849_DeleteD419_ptr: TIntegerField;
    dt0849_DeleteD073_ptr: TIntegerField;
    dt0849_DeleteGridName: TStringField;
    dt0849_DeleteFieldName: TStringField;
    dt0849_DeleteFieldCaption: TStringField;
    dt0849_DeleteFieldOrder: TIntegerField;
    dt0849_DeleteFieldWidth: TIntegerField;
    dt0849_DeleteIsDisplay: TBooleanField;
    dt0849_DeleteFormName: TStringField;
    cds0849_DeleteFormName: TStringField;
    cdsTemp: TClientDataSet;
    procedure cds0849_DeleteFieldOrderChange(Sender: TField);
    
   // procedure cds0849FieldOrderChange(Sender: TField);
  private
    
    { Private declarations }
  public
    cdsTempFilterValue:string;
    procedure cdsTemp_FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
      {
procedure TDM.cds0849FieldOrderChange(Sender: TField);
var
  i:Integer;
begin
  if UpperCase(Sender.FieldName )=UpperCase('FieldOrder') then
  begin
    for i:=0 to frm_EquiMainAnal.DghMain.Columns.Count-1 do
    begin
      if UpperCase(cds0849.FieldByName('FieldName').AsString)
            = UpperCase(frm_EquiMainAnal.DghMain.Columns[i].Field.FieldName)  then
      begin
        frm_EquiMainAnal.DghMain.Columns[i].Index:=Sender.AsInteger;
        Break;
      end;
    end;
  end
  else
  if UpperCase(Sender.FieldName )=UpperCase('FieldWidth') then
  begin
    for i:=0 to frm_EquiMainAnal.DghMain.Columns.Count-1 do
    begin
      if UpperCase(cds0849.FieldByName('FieldName').AsString)
            = UpperCase(frm_EquiMainAnal.DghMain.Columns[i].Field.FieldName)  then
      begin
        frm_EquiMainAnal.DghMain.Columns[i].Width:=Sender.AsInteger;
        Break;
      end;
    end;
  end
  else
  if UpperCase(Sender.FieldName )=UpperCase('IsDisplay') then
  begin
    for i:=0 to frm_EquiMainAnal.DghMain.Columns.Count-1 do
    begin
      if UpperCase(cds0849.FieldByName('FieldName').AsString)
            = UpperCase(frm_EquiMainAnal.DghMain.Columns[i].Field.FieldName)  then
      begin
        frm_EquiMainAnal.DghMain.Columns[i].Visible:=Sender.AsBoolean;
        Break;
      end;
    end;
  end  ;
end;     }

procedure TDM.cds0849_DeleteFieldOrderChange(Sender: TField);
begin
//
end;

procedure TDM.cdsTemp_FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if cdsTempFilterValue<>'' then
  Accept:=UpperCase(DataSet.FieldByName('item').AsString)=UpperCase(cdsTempFilterValue) ;
  //Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName('item').AsString),UpperCase(cdsTempFilterValue)) ;
end;

end.
