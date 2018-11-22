unit micpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, ExtCtrls,ComObj, Excel2000,
  Menus,ClipBrd;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    ADOQuery1PO_REQ_NUMBER: TStringField;
    ADOQuery1DEPARTMENT_NAME: TStringField;
    ADOQuery1STATUS: TWordField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1WAREHOUSE_NAME: TStringField;
    ADOQuery1CODE: TStringField;
    ADOQuery1DESCRIPTION_1: TStringField;
    ADOQuery1DESCRIPTION_2: TStringField;
    ADOQuery1QUANTITY_REQUIRED: TFloatField;
    ADOQuery1UNIT_PRICE: TFloatField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1total: TFloatField;
    ADOQuery1v_status: TStringField;
    ADOQuery1gui_ge: TStringField;
    ADOQuery1rkey: TIntegerField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADOQuery1reason: TStringField;
    ADOQuery1AUTH_DATE: TDateTimeField;
    ADOQuery1ENT_DATE: TDateTimeField;
    ADOQuery1EDITED_DATE: TDateTimeField;
    ADOQuery1REQ_DATE: TDateTimeField;
    procedure Button1Click(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses main, auth_info;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
 form1.show;
 close;
end;

procedure TForm3.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 case adoquery1status.Value of
  1 : adoquery1v_status.Value := '待审批';
  2 : adoquery1v_status.Value := '待采购';
  3 : adoquery1v_status.Value := '已批准';
  4 : adoquery1v_status.Value := '被退回';
  5 : adoquery1v_status.Value := '请购单已撤消';
  6 : adoquery1v_status.Value := '请购单已处理';
  7 : adoquery1v_status.Value := '未提交';  
 end;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm3.Button2Click(Sender: TObject);
var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
 begin
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
      sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
        sline := sline + DBGrid1.Fields[col].AsString + #9;
      mem.Add(sline);
      DBGrid1.DataSource.DataSet.Next;
    end;

    // we copy the data to the clipboard
    clipboard.Clear;
    Clipboard.AsText:=mem.Text;

    // if needed, send it to Excel
    // if not, we already have it in the clipboard
    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
  //  FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm3.N1Click(Sender: TObject);
begin
 try
  form6 := tform6.Create(application);
  form1.ados276.Close;
  form1.ados276.Parameters[1].Value := ADOQuery1rkey.Value;
  form1.ados276.Open;
  form6.ShowModal;
 finally
  form6.Free;
  form1.ados276.Close;
 end;
end;

end.
