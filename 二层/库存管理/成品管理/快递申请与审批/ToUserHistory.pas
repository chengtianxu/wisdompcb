unit ToUserHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DM, DB, ADODB, Grids, DBGridEh;

type
  TfrmToUserHistory = class(TForm)
    pnl1: TPanel;
    edtFilter: TLabeledEdit;
    pnl2: TPanel;
    eh1: TDBGridEh;
    ads817: TADODataSet;
    ds817: TDataSource;
    btn1: TButton;
    ads817touser: TStringField;
    ads817tophone: TStringField;
    ads817toaddress: TStringField;
    ads817CustName: TStringField;
    procedure eh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure eh1DblClick(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
  public
    { Public declarations }
  end;


implementation

uses
  WZ_gUnit;

{$R *.dfm}

procedure TfrmToUserHistory.eh1TitleClick(Column: TColumnEh);
begin
  FHotColumn := Column;
  edtFilter.EditLabel.Caption := FHotColumn.Title.Caption;

  if (Column.Title.SortMarker = smNoneEh) or (Column.Title.SortMarker = smDownEh) then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
    Column.Title.SortMarker := smUpEh;
  end
  else
  if Column.Title.SortMarker = smUpEh then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
    Column.Title.SortMarker := smDownEh;
  end ;
end;

procedure TfrmToUserHistory.FormShow(Sender: TObject);
begin
  ads817.Parameters[0].Value := gUser.User_Ptr;
  ads817.Open;
  eh1TitleClick(eh1.Columns[0]);
end;

procedure TfrmToUserHistory.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk
end;

procedure TfrmToUserHistory.eh1DblClick(Sender: TObject);
begin
  btn1Click(btn1);
end;

procedure TfrmToUserHistory.edtFilterChange(Sender: TObject);
var
  tmpstr,sFilter:string;
  DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(eh1.DataSource.DataSet);
  if not DATASET.Active then Exit;
  tmpstr:= trim(edtFilter.Text);
  if TmpStr='' then
  begin
    DATASET.Filtered:= False;
  end else
  begin
    if (FHotColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      DATASET.Filter := FHotColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      try
        StrToFloat(tmpstr);
      except
        DATASET.Filtered := False;
        Exit;
      end;
      sFilter := FHotColumn.Field.FieldName+'>='+TmpStr;
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      try
        tmpstr := FormatDateTime('YYYY-MM-DD hh:mm:ss',StrToDateTime(TmpStr));
      except
        Exit;
      end;
      sFilter := '>='+QuotedStr(TmpStr);
      DATASET.Filter := FHotColumn.Field.FieldName + sFilter;
      DATASET.Filtered:= true;
    end;
  end;
end;

end.
