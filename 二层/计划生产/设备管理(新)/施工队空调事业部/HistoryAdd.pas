unit HistoryAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGridEh, Mask,
  DBCtrlsEh, DB, Provider, DBClient, ADODB;

type
  Tfrm_HistoryAdd = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    DBDTE_CompTime: TDBDateTimeEditEh;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    BtnOk: TButton;
    BtnCancel: TButton;
    ADS835: TADODataSet;
    ADS837: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADS835rkey: TAutoIncField;
    ADS835DSDesigner: TStringField;
    ADS835DSDesigner2: TStringField;
    ADS835DSDesigner4: TStringField;
    ADS835DSDesigner5: TStringField;
    CDS837: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ADS835DSDesigner3: TStringField;
    ADS837selected: TBooleanField;
    ADS837WorkDate: TDateTimeField;
    ADS837BeginTime: TDateTimeField;
    ADS837EndTime: TDateTimeField;
    ADS837EMPL_CODE: TStringField;
    ADS837EMPLOYEE_NAME: TStringField;
    ADS837Work_ptr: TIntegerField;
    ADS837Empl_ptr: TIntegerField;
    CDS837selected: TBooleanField;
    CDS837WorkDate: TDateTimeField;
    CDS837BeginTime: TDateTimeField;
    CDS837EndTime: TDateTimeField;
    CDS837EMPL_CODE: TStringField;
    CDS837EMPLOYEE_NAME: TStringField;
    CDS837Work_ptr: TIntegerField;
    CDS837Empl_ptr: TIntegerField;
    Label2: TLabel;
    Edit1: TEdit;
    procedure CheckBox1Click(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADS835AfterScroll(DataSet: TDataSet);
    procedure CDS837BeforeDelete(DataSet: TDataSet);
    procedure CDS837BeforeInsert(DataSet: TDataSet);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
  private
    PreColumn:TColumnEh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_HistoryAdd: Tfrm_HistoryAdd;

implementation

uses damo;

{$R *.dfm}

procedure Tfrm_HistoryAdd.CheckBox1Click(Sender: TObject);
var
  BM:Pointer;//TBookmark;
begin
  with DBGridEh2.DataSource.DataSet do
  begin
    bm:=GetBookmark;//书签。
    try
      DisableControls;
      Screen.Cursor := crHourGlass;
      First;
      while not Eof do
      begin
        Edit;
        if (Sender as  TCheckBox).Checked then
          FieldByName('selected').Value:=True
        else
          FieldByName('selected').Value:=False;
        Next;
      end;
      GotoBookmark(BM);  // 重新定位到书签
    finally
      FreeBookmark(bm ); //释放书签。
      EnableControls ;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure Tfrm_HistoryAdd.BtnOkClick(Sender: TObject);
begin
  if VarIsNull(DBDTE_CompTime.Value) then
  begin
    ShowMessage('请输入“工作日期”！！！');
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure Tfrm_HistoryAdd.FormShow(Sender: TObject);
begin
  PreColumn := DBGridEh1.Columns[0];
  ADS835.Open;
  CDS837.Open;
end;

procedure Tfrm_HistoryAdd.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(ADS835.CommandText);
end;

procedure Tfrm_HistoryAdd.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(ADS837.CommandText);
end;

procedure Tfrm_HistoryAdd.ADS835AfterScroll(DataSet: TDataSet);
begin
  StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(ADS835.RecNo)+
  '/总记录数:'+ IntToStr(ADS835.RecordCount);
end;

procedure Tfrm_HistoryAdd.CDS837BeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure Tfrm_HistoryAdd.CDS837BeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure Tfrm_HistoryAdd.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if(PreColumn.FieldName<>Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    Label2.Caption := Column.Title.Caption;
    Edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clRed;
    PreColumn := Column;
  end
  else
  Edit1.SetFocus;
end;

procedure Tfrm_HistoryAdd.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(Edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

end.
