unit uSumQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, DB, ADODB, main, common,
  ComCtrls;

type
  TfrmSumQuery = class(TForm)
    dsQuery: TDataSource;
    aqQuery: TADOQuery;
    aqQueryCUT_NO: TStringField;
    aqQueryMANU_PART_NUMBER: TStringField;
    aqQueryMANU_PART_DESC: TStringField;
    aqQueryANALYSIS_CODE_2: TStringField;
    aqQueryPROD_CODE: TStringField;
    aqQueryPRODUCT_NAME: TStringField;
    aqQueryDEPT_CODE: TStringField;
    aqQueryDEPT_NAME: TStringField;
    aqQueryISSUE_DATE: TDateTimeField;
    aqQuerySCH_COMPL_DATE: TDateTimeField;
    aqQuerytotal_qtypcs: TFloatField;
    aqQuerytotal_qtypanel: TIntegerField;
    aqQuerytotal_tobestock: TFloatField;
    aqQueryprod_Square: TFloatField;
    aqQueryprod_Square_includingBoader: TFloatField;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sbtnExit: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    btnQuery: TBitBtn;
    btnExcel: TBitBtn;
    qry2: TADOQuery;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField1: TFloatField;
    IntegerField1: TIntegerField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    ds2: TDataSource;
    DBGridEh2: TDBGridEh;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure sbtnExitClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btnExcelClick(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FList: TStringList;
    procedure getkuanshu;
  end;

var
  frmSumQuery: TfrmSumQuery;

implementation

{$R *.dfm}

procedure TfrmSumQuery.sbtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSumQuery.btnQueryClick(Sender: TObject);
begin
  aqQuery.Close;
  aqQuery.Open;

  qry2.Close;
  qry2.Open;
  Edit1Change(nil);
  getkuanshu;
end;

procedure TfrmSumQuery.FormShow(Sender: TObject);
begin
  pgc1.ActivePageIndex := 0;
  btnQueryClick(btnQuery);
end;

procedure TfrmSumQuery.Edit1Change(Sender: TObject);
begin
  if not aqQuery.Active then Exit;
  aqQuery.Filter:= '';
  if Edit1.Text<>'' then aqQuery.Filter:= 'MANU_PART_NUMBER like ''%'+Edit1.Text+'%''';
  if Edit2.Text<>'' then
  begin
    if aqQuery.Filter='' then
      aqQuery.Filter:= 'MANU_PART_DESC like ''%'+Edit2.Text+'%'''
    else
      aqQuery.Filter:= aqQuery.Filter+' and MANU_PART_DESC like ''%'+Edit2.Text+'%''';
  end;
  if Edit3.Text<>'' then
  begin
    if aqQuery.Filter='' then
      aqQuery.Filter:= 'DEPT_CODE like ''%'+Edit3.Text+'%'''
    else
      aqQuery.Filter:= aqQuery.Filter+' and DEPT_CODE like ''%'+Edit3.Text+'%''';
  end;
  if Edit4.Text<>'' then
  begin
    if aqQuery.Filter='' then
      aqQuery.Filter:= 'DEPT_NAME like ''%'+Edit4.Text+'%'''
    else
      aqQuery.Filter:= aqQuery.Filter+' and DEPT_NAME like ''%'+Edit4.Text+'%''';
  end;


  qry2.Filter:= '';
  if Edit1.Text<>'' then qry2.Filter:= 'MANU_PART_NUMBER like ''%'+Edit1.Text+'%''';
  if Edit2.Text<>'' then
  begin
    if qry2.Filter='' then
      qry2.Filter:= 'MANU_PART_DESC like ''%'+Edit2.Text+'%'''
    else
      qry2.Filter:= qry2.Filter+' and MANU_PART_DESC like ''%'+Edit2.Text+'%''';
  end;
  if Edit3.Text<>'' then
  begin
    if qry2.Filter='' then
      qry2.Filter:= 'DEPT_CODE like ''%'+Edit3.Text+'%'''
    else
      qry2.Filter:= qry2.Filter+' and DEPT_CODE like ''%'+Edit3.Text+'%''';
  end;
  if Edit4.Text<>'' then
  begin
    if qry2.Filter='' then
      qry2.Filter:= 'DEPT_NAME like ''%'+Edit4.Text+'%'''
    else
      qry2.Filter:= qry2.Filter+' and DEPT_NAME like ''%'+Edit4.Text+'%''';
  end;

  getkuanshu;
end;

procedure TfrmSumQuery.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmsg(aqQuery.SQL.Text,1);
end;

procedure TfrmSumQuery.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  if TDBGridEh(Sender).DataSource.DataSet.Active then
  begin
    if TDBGridEh(Sender).DataSource.DataSet is TADOQuery then
    begin
      if Column.Title.SortMarker = smDownEh then  //≈≈–Ú
        TADOQuery(TDBGridEh(Sender).DataSource.DataSet).Sort:= Column.FieldName
      else
        TADOQuery(TDBGridEh(Sender).DataSource.DataSet).Sort:= Column.FieldName + ' DESC';
    end;
  end;
end;

procedure TfrmSumQuery.btnExcelClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1, self.Caption);
end;

procedure TfrmSumQuery.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
  showmsg(qry2.SQL.Text,1);
end;

procedure TfrmSumQuery.getkuanshu;
begin
  FList.Clear;
  qry2.DisableControls;
  try
    qry2.First;
    while not qry2.Eof do
    begin
      if FList.IndexOf(qry2.FieldByName('manu_part_number').AsString) = -1 then
        FList.Add(qry2.FieldByName('manu_part_number').AsString);
      qry2.Next;
    end;
  finally
    qry2.EnableControls;
  end;
  lbl1.Caption := IntToStr(FList.Count);
end;

procedure TfrmSumQuery.FormCreate(Sender: TObject);
begin
  FList := TStringList.Create;
end;

procedure TfrmSumQuery.FormDestroy(Sender: TObject);
begin
  FList.Free;
end;

end.
