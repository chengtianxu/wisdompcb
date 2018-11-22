unit BMListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ExtCtrls, DB, ADODB;

type
  TfrmBMList = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    edtFilter: TLabeledEdit;
    rg1: TRadioGroup;
    ehBMlist: TDBGridEh;
    pnl3: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    ds1: TDataSource;
    adsBMList: TADODataSet;
    adsBMListrkey: TAutoIncField;
    adsBMListdept_code: TStringField;
    adsBMListdept_name: TStringField;
    adsBMListstep_number: TSmallintField;
    adsBMListsteptype: TStringField;
    procedure rg1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure ehBMlistDblClick(Sender: TObject);
    procedure ehBMlistTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure edtFilterKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
  public
    FRkey25: string;
    { Public declarations }
  end;

implementation

uses DmUnit1;

{$R *.dfm}

procedure TfrmBMList.rg1Click(Sender: TObject);
begin
  adsBMList.Close;
  case rg1.ItemIndex of
    0:
    begin
    adsBMList.CommandText:='select data0034.rkey,data0034.dept_code,data0034.dept_name,data0038.step_number,'+
    'CASE data0034.TTYPE WHEN 1 THEN ''工序'' WHEN 4 THEN ''部门'' WHEN 5 THEN ''班组'' END AS steptype'+
    ' from data0034 inner join data0038 on'+
    ' data0038.dept_ptr=data0034.rkey where data0034.BARCODE_ENTRY_FLAG=''Y''' +
    'and data0038.source_ptr=:rkey0025';
    adsBMList.Parameters[0].Value:=FRkey25;
    end;
    1:
    begin
      adsBMList.CommandText := 'SELECT RKey , DEPT_CODE,null as step_number, DEPT_NAME, CASE TTYPE WHEN 1 THEN ''工序'' WHEN 4 THEN ''部门'' WHEN 5 THEN ''班组'' END AS steptype FROM Data0034 ORDER BY TTYPE';
    end;
  end;
  adsBMList.Open;
  ehBMlistTitleClick(ehBMlist.Columns[0]);
end;

procedure TfrmBMList.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmBMList.ehBMlistDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmBMList.ehBMlistTitleClick(Column: TColumnEh);
begin
  FHotColumn := Column;
  edtFilter.EditLabel.Caption := FHotColumn.Title.Caption;
end;

procedure TfrmBMList.edtFilterChange(Sender: TObject);
var
  tmpstr,sFilter:string;
  DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(ehBMlist.DataSource.DataSet);
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

procedure TfrmBMList.edtFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not adsBMList.IsEmpty) then
  begin
    ModalResult := mrOk;
    Exit;
  end;
  if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TLabeledEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TLabeledEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TLabeledEdit).text)>0 then
      if (key='-') then abort;
  end else
  if  FHotColumn.Field.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TLabeledEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TLabeledEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TLabeledEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TLabeledEdit).text)>0 then
      if (key='-') then abort;
  end ;
end;

procedure TfrmBMList.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
