unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    aq60: TADOQuery;
    qryTmp: TADOQuery;
    ds60: TDataSource;
    aqParamList: TADOQuery;
    aqOrderChosen: TADOQuery;
    dsOrderChosen: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CopyRecord(SrcDataSet,DesDataSet:TADOQuery);
    procedure DeleteData(Dataset:TDataSet);
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }

procedure TDM.CopyRecord(SrcDataSet, DesDataSet: TADOQuery);
var
  i:integer;
  FieldName:string;
begin
  DesDataSet.Append;
  for i := 0 to SrcDataSet.Fields.Count-1 do
  begin
    FieldName:=SrcDataSet.Fields[i].FieldName;
//    if DesDataSet.FieldList.IndexOf(FieldName)>0 then
    DesDataSet.FieldByName(SrcDataSet.Fields[i].FieldName).value:=SrcDataSet.Fields[i].value;
  end;
  if DesDataSet.State in dsEditModes then
    DesDataSet.Post;
end;

procedure TDM.DeleteData(Dataset: TDataSet);
begin
  Dataset.DisableControls;
  try
    Dataset.First;
    while not Dataset.Eof do
      Dataset.Delete;
  finally
    Dataset.EnableControls;
  end;
end;

end.
