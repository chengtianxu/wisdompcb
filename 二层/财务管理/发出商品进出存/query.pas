unit query;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, main, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons,
  ComCtrls, Comobj, Excel97;

type
  TfrmQuery = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    aqQuery: TADOQuery;
    dsQuery: TDataSource;
    DBGridEh1: TDBGridEh;
    aqQueryCUST_CODE: TStringField;
    aqQueryABBR_NAME: TStringField;
    aqQueryCUSTOMER_NAME: TStringField;
    aqQueryMANU_PART_NUMBER: TStringField;
    aqQueryMANU_PART_DESC: TStringField;
    aqQueryANALYSIS_CODE_2: TStringField;
    aqQueryLAYERS: TWordField;
    aqQueryPRODUCT_NAME: TStringField;
    aqQueryANALYSIS_CODE_1: TStringField;
    aqQueryunit_sq: TFloatField;
    aqQuerySALES_ORDER: TStringField;
    aqQueryDATE_SHIPPED: TDateTimeField;
    aqQueryTAX_2: TBCDField;
    aqQuerytype: TStringField;
    aqQueryinvoice_number: TStringField;
    aqQueryrkey: TIntegerField;
    aqQueryBQnty: TIntegerField;
    aqQueryBAmount: TBCDField;
    aqQueryInQnty: TIntegerField;
    aqQueryInAmount: TBCDField;
    aqQueryOutQnty: TIntegerField;
    aqQueryOutAmount: TBCDField;
    aqQueryEQnty: TIntegerField;
    aqQueryEAmount: TBCDField;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    lblFilter: TLabel;
    edtFilter: TEdit;
    aqQueryQntyBalance: TStringField;
    aqQueryAmountBalance: TStringField;
    aqQueryAllBalance: TStringField;
    sb1: TStatusBar;
    aqQueryabbr_name23: TStringField;
    aqQuerycost_Price: TFloatField;
    aqQueryBAmount1: TFloatField;
    aqQueryInAmount1: TFloatField;
    aqQueryOutAmount1: TFloatField;
    aqQueryEAmount1: TFloatField;
    aqQueryAmountBalance1: TStringField;
    aqQueryCURR_CODE: TStringField;
    aqQueryOutAdjustAMT: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aqQueryBeforeOpen(DataSet: TDataSet);
    procedure aqQueryAfterOpen(DataSet: TDataSet);
    procedure edtFilterExit(Sender: TObject);
  private
    Field_Name: String;
    PreColumn: TColumnEh;
  public
    procedure InitForm(vtype:byte; param1,param2:integer);
    procedure CopyToExcel(dbGrid: TDBGridEh; titleCaption: string);
  end;

var
  frmQuery: TfrmQuery;

implementation

uses common, wait;

{$R *.dfm}

{ TfrmQuery }

procedure TfrmQuery.InitForm(vtype:byte; param1,param2:integer);
begin
  with aqQuery do
  begin
    Close;
    SQL.Clear;
    if vtype=0 then
      SQL.Add('Exec SP_140;2 :param1, :param2')
    else
      SQL.Add('Exec SP_140;3 :param1, :param2');
    Parameters.ParamByName('param1').Direction:=pdInput;
    Parameters.ParamByName('param2').Direction:=pdInput;
    Parameters.ParamByName('param1').Value:=param1;
    Parameters.ParamByName('param2').Value:=param2;
    Open;
  end;
  sb1.Panels[0].Text:='行数：' + IntToStr(aqQuery.RecordCount);
end;

procedure TfrmQuery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if aqQuery.Active then aqQuery.Close;
  Action:= caFree;
end;

procedure TfrmQuery.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmQuery.btnRefreshClick(Sender: TObject);
var
  gt:Variant;
begin
  gt:= VarArrayOf([aqQuery.FieldByName('type').AsString, aqQuery.FieldByName('rkey').AsString]);
  with aqQuery do
  begin
    Close;
    Parameters.ParamByName('param1').Value:=frmMain.aqBrowse.FieldByName('FromRKEY').AsInteger;
    Parameters.ParamByName('param2').Value:=frmMain.aqBrowse.FieldByName('ToRKEY').AsInteger;
    Open;
  end;
  sb1.Panels[0].Text:='行数：' + IntToStr(aqQuery.RecordCount);
  if aqQuery.RecordCount>0 then aqQuery.Locate('type;rkey',gt,[]);
end;

procedure TfrmQuery.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.Active then
  begin
    if TDBGridEh(Sender).DataSource.DataSet is TADOQuery then
    begin
      if Column.Title.SortMarker = smDownEh then  //排序
        TADOQuery(TDBGridEh(Sender).DataSource.DataSet).Sort:= Column.FieldName
      else
        TADOQuery(TDBGridEh(Sender).DataSource.DataSet).Sort:= Column.FieldName + ' DESC';
    end;
  end;
end;

procedure TfrmQuery.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.Active then
  begin
    if Field_Name <> Column.FieldName then
    begin
      Field_Name:= Column.FieldName;
      lblFilter.Caption:= Column.Title.Caption;
      edtFilter.Text:= '' ;
      edtFilter.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end
    else
    if Field_Name = Column.FieldName then
    begin
      edtFilter.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end;
  end;
end;

procedure TfrmQuery.edtFilterChange(Sender: TObject);
var
  S: String;
begin
  DBGridEh1.SumList.Active:= False;  //处理DBGridEh1汇总导致的性能问题
  IF DBGridEh1.DataSource.DataSet.Active Then
  begin
    DBGridEh1.DataSource.DataSet.Filter := '';
    S:= '';
    if trim(edtFilter.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.Fields.FieldByName(Field_Name).DataType in [ftString, ftWideString] then
      begin
        if S = '' then
          S:= Field_Name + ' like ''%' + Trim(edtFilter.text) + '%'''
        else
          S:= S + ' and ' + Field_Name + ' like ''%' + trim(edtFilter.text) + '%''';
      end
      else
      if DBGridEh1.DataSource.DataSet.Fields.FieldByName(Field_Name).DataType in [ftSmallint, ftInteger, ftWord] then
      begin
        try
          StrToInt(edtFilter.Text);
          if S = '' then
            S:= Field_Name + ' = ' + trim(edtFilter.text)
          else
            S:= S + ' and ' + Field_Name+' = ' + trim(edtFilter.text);
        except
          ShowMessage('输入的内容不符，请输入数字！');
        end;
      end;
    end;
    DBGridEh1.DataSource.DataSet.Filter:= S;
  end;
  sb1.Panels[0].Text:='行数：' + IntToStr(aqQuery.RecordCount);
end;

procedure TfrmQuery.FormShow(Sender: TObject);
begin
  Field_Name:= DBGridEh1.Columns[0].FieldName;
  PreColumn:= DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color:= clred;
end;

procedure TfrmQuery.btnExportClick(Sender: TObject);
begin
  frmWait:= TfrmWait.Create(Application);
  try
    frmWait.Label1.Caption:='正在导出,请稍等!';
    frmWait.Show;
    frmWait.Update;
    frmWait.Animate1.CommonAVI:=aviCopyFile;     
    frmWait.Animate1.Active:=True;
    Export_dbGridEH_to_Excel(DBGridEh1,'发出商品进出存');
//    CopyToExcel(DBGridEh1,'发出商品进出存');
  finally
    frmWait.Close;
    frmWait.Free;
  end;
end;

procedure TfrmQuery.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Byte;
  Param: string;
begin
  for i:= 0 to aqQuery.Parameters.Count-1 do
  begin
    if i = 0 then
      Param:= '参数'+IntToStr(i+1)+':'+VarToStr(aqQuery.Parameters[i].Value)+#13
    else
    begin
      Param:= Param+'参数'+IntToStr(i+1)+':'+VarToStr(aqQuery.Parameters[i].Value);
      if VarToStr(aqQuery.Parameters[i].Value) = '' then Param:= Param+#13;
    end;
  end;
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg(aqQuery.SQL.Text+#13+Param, mtInformation, [mbOK], 0);
end;

procedure TfrmQuery.aqQueryBeforeOpen(DataSet: TDataSet);
begin
  frmWait:= TfrmWait.Create(Application);
  frmWait.Label1.Caption:='正在查询,请稍等!';
  frmWait.Show;
  frmWait.Update;
  frmWait.Animate1.Active:=True;
end;

procedure TfrmQuery.aqQueryAfterOpen(DataSet: TDataSet);
begin
  frmWait.Close;
  frmWait.Free;
end;

procedure TfrmQuery.edtFilterExit(Sender: TObject);
begin
  DBGridEh1.SumList.Active:= True;
end;

procedure TfrmQuery.CopyToExcel(dbGrid: TDBGridEh; titleCaption: string);
var
  bm: TBookmark;
  col,row: Integer;
  sline: String;
  mem: TMemo;
  ExcelApp: Variant;
begin
  Screen.Cursor := crHourglass;
  dbGrid.DataSource.DataSet.DisableControls;
  try
    bm:= dbGrid.DataSource.DataSet.GetBookmark;
    dbGrid.DataSource.DataSet.First;
    ExcelApp:= CreateOleObject('Excel.Application');  //uses Comobj
    ExcelApp.WorkBooks.Add(xlWBatWorkSheet);  //uses Excel97
    ExcelApp.WorkBooks[1].WorkSheets[1].Name := titleCaption;
    mem:= TMemo.Create(Self);
    mem.Visible:= false;
    mem.Parent:= self;
    mem.Clear;
    sline:= '';
    for col := 0 to dbGrid.FieldCount-1 do
      sline := sline + dbGrid.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);
    for row := 0 to dbGrid.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to dbGrid.FieldCount-1 do
        sline := sline + dbGrid.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      dbGrid.DataSource.DataSet.Next;
    end;
    mem.SelectAll;
    mem.CopyToClipboard;
    ExcelApp.Workbooks[1].WorkSheets[titleCaption].Paste;
    ExcelApp.Visible := true;
    FreeAndNil(mem);
    dbGrid.DataSource.DataSet.GotoBookmark(bm);
    dbGrid.DataSource.DataSet.FreeBookmark(bm);
  finally
    dbGrid.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

end.
