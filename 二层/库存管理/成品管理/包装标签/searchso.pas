unit searchso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, Buttons, StdCtrls, ComCtrls, ExtCtrls;

type
  Tsearchso_Form = class(TForm)
    ADS60: TADODataSet;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    CheckBox6: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    ADS60RKEY: TIntegerField;
    ADS60SALES_ORDER: TStringField;
    ADS60PARTS_ORDERED: TFloatField;
    ADS60v_status: TStringField;
    ADS60SCH_DATE: TDateTimeField;
    ADS60PO_NUMBER: TStringField;
    ADS60ABBR_NAME: TStringField;
    ADS60CUST_CODE: TStringField;
    ADS60MANU_PART_DESC: TStringField;
    ADS60MANU_PART_NUMBER: TStringField;
    ADS60REFERENCE_NUMBER: TStringField;
    ADS60ANALYSIS_CODE_2: TStringField;
    ADS60weijao_qty: TFloatField;
    DBGrid1: TDBGrid;
    procedure dtpk1Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumn;
  public
    { Public declarations }
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
  end;

var
  searchso_Form: Tsearchso_Form;

implementation

uses DAMO;

{$R *.dfm}

procedure Tsearchso_Form.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;

procedure Tsearchso_Form.dtpk1Exit(Sender: TObject);
begin
  ads60.Close;
  ads60.Parameters[0].Value:=dtpk1.Date;
  ads60.Parameters[1].Value:=dtpk2.Date+1;
  ads60.Open;
end;

procedure Tsearchso_Form.CheckBox1Click(Sender: TObject);
begin
 ads60.Close;
if not checkbox1.Checked then
 ads60.Parameters[2].Value:=1      //有效的
else
 ads60.Parameters[2].Value:=0;
if not checkbox2.Checked then             //暂缓
 ads60.Parameters[3].Value:=2
else
 ads60.Parameters[3].Value:=0;
if not checkbox3.Checked then           //已结算
 ads60.Parameters[4].Value:=3
else
 ads60.Parameters[4].Value:=0;
if not checkbox4.Checked then           //已完成
 ads60.Parameters[5].Value:=4
else
 ads60.Parameters[5].Value:=0;
if not checkbox5.Checked then           //已取消
 ads60.Parameters[6].Value:=5
else
 ads60.Parameters[6].Value:=0;
if not checkbox6.Checked then           //未提交
 ads60.Parameters[7].Value:=6
else
 ads60.Parameters[7].Value:=0;
 ads60.open;
end;

procedure Tsearchso_Form.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS60.CommandText);

 if (key=13) and (not ADS60.IsEmpty) then
 ModalResult:=mrok;
end;

procedure Tsearchso_Form.DBGrid1TitleClick(Column: TColumn);
begin
  if self.PreColumn <> column then
   ads60.IndexFieldNames:=Column.FieldName;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure Tsearchso_Form.FormActivate(Sender: TObject);
begin
PreColumn:=self.DBGrid1.Columns[2];
end;

procedure Tsearchso_Form.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   ads60.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else ads60.filter := '';
end;

procedure Tsearchso_Form.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
end;

procedure Tsearchso_Form.DBGrid1DblClick(Sender: TObject);
begin
if (not ads60.IsEmpty) then
 ModalResult:=mrok;
end;

procedure Tsearchso_Form.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ads60.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure Tsearchso_Form.FormCreate(Sender: TObject);
begin
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

end.
