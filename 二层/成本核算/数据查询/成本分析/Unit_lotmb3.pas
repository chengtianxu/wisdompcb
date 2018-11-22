unit Unit_lotmb3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh
  ,Excel2000, OleServer,ClipBrd, ExcelXP, ADODB;

type
  TForm_lotmb3 = class(TForm)
    DataSource21: TDataSource;
    DataSource22: TDataSource;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Splitter1: TSplitter;
    ADOS_21: TADOStoredProc;
    ADOS_21RKEY: TAutoIncField;
    ADOS_21D0451_PTR: TIntegerField;
    ADOS_21DEPT_PTR: TIntegerField;
    ADOS_21OVHD_1: TBCDField;
    ADOS_21OVHD_2: TBCDField;
    ADOS_21OVHD_3: TBCDField;
    ADOS_21yield_sqft: TBCDField;
    ADOS_21yield_amount: TBCDField;
    ADOS_21STD_OVHD_1: TBCDField;
    ADOS_21STD_OVHD_2: TBCDField;
    ADOS_21STD_OVHD_3: TBCDField;
    ADOS_21yield_sqft_wf: TBCDField;
    ADOS_21OVHD_4: TBCDField;
    ADOS_21OVHD_5: TBCDField;
    ADOS_22: TADODataSet;
    ADOS_22MANU_PART_NUMBER: TStringField;
    ADOS_22manu_part_desc: TStringField;
    ADOS_22WORK_ORDER_NUMBER: TStringField;
    ADOS_22QTY_PROD: TIntegerField;
    ADOS_22PARAMETER_VALUE: TFloatField;
    ADOS_22sc_sqft: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_lotmb3: TForm_lotmb3;

implementation
 uses  uMD;

{$R *.dfm}

procedure TForm_lotmb3.BitBtn1Click(Sender: TObject);
begin
   ModalResult := mrOK;
end;

procedure TForm_lotmb3.BitBtn2Click(Sender: TObject);
var
  eaApps1: TExcelApplication;
     y   : integer;
  tsList : TStringList;
  s,s1,t : string;
  aSheet : Variant;
  j,vleng:integer;
  vstr:string;
begin
  if messagedlg('要把数据资料导出到EXCEL文件吗？',mtconfirmation,[mbYes,mbNo],0)<>mrYes then exit;
  eaapps1:=TExcelApplication.Create(self);
  try
    eaapps1.connect;
  except
    messagedlg('是否正确安装了EXCEL？',mtinformation,[mbok],0);
    Abort;
  end;

  eaapps1.Workbooks.Add(xlWBATWorksheet,0);
  eaapps1.worksheets.Add(null,null,1,null,0);


  ADOS_21.DisableControls;


  aSheet:=eaapps1.Worksheets[1];

  s:='序号'+#9;
  tsList:=TStringList.Create;
  try
    for y:=0 to DBGridEh1.Columns.Count-1 do
      s:=s+DBGridEh1.Columns.Items[y].Title.Caption+#9;
    tsList.Add(s);
    DBGridEh1.DataSource.DataSet.First;
    while not DBGridEh1.DataSource.DataSet.Eof do
      begin
        s:=inttostr(DBGridEh1.DataSource.DataSet.RecNo)+#9;
        for y:=0 to DBGridEh1.Columns.Count-1 do
          begin
            s1:=DBGridEh1.Columns.Items[y].Field.text;
            s:=s+s1+#9;
          end;
        tsList.Add(s);
        DBGridEh1.DataSource.DataSet.Next;
      end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
  finally
    tsList.Free;
    eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if DBGridEh1.Columns.Count+1<=26 then
     vstr:=chr(DBGridEh1.Columns.Count+1+96)
  else
   begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh1.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh1.Columns.Count+1-26*int((DBGridEh1.Columns.Count+1)/26)+96)));
   end;
  //  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='制造费用实际';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  //asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('cut_date').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh1.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='制造费用实际';
  {}
  ADOS_21.EnableControls;
  ADOS_22.DisableControls;

  aSheet:=eaapps1.Worksheets[2];

  s:='序号'+#9;
  tsList:=TStringList.Create;
  try
    for y:=0 to DBGridEh2.Columns.Count-1 do
      s:=s+DBGridEh2.Columns.Items[y].Title.Caption+#9;
    tsList.Add(s);
    DBGridEh2.DataSource.DataSet.First;
    while not DBGridEh2.DataSource.DataSet.Eof do
      begin
        s:=inttostr(DBGridEh2.DataSource.DataSet.RecNo)+#9;
        for y:=0 to DBGridEh2.Columns.Count-1 do
          begin
            s1:=DBGridEh2.Columns.Items[y].Field.text;
            s:=s+s1+#9;
          end;
        tsList.Add(s);
        DBGridEh2.DataSource.DataSet.Next;
      end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
  finally
    tsList.Free;
    eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if DBGridEh2.Columns.Count+1<=26
    then vstr:=chr(DBGridEh2.Columns.Count+1+96)
  else begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh2.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh2.Columns.Count+1-26*int((DBGridEh2.Columns.Count+1)/26)+96)));
  end;
  //  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='制造费用标准';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  //asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('cut_date').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh2.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='制造费用标准';
  {}
  ADOS_22.EnableControls;
  eaapps1.Visible[0]:=true;         // display Excel files
end;


procedure TForm_lotmb3.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ADOS_22.CommandText);
end;

end.
