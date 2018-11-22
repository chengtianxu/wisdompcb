unit Unit_lotmb2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons
  ,Excel2000, OleServer,ClipBrd, ExcelXP, Menus;

type
  TForm_lotmb2 = class(TForm)
    DataSource19: TDataSource;
    DataSource20: TDataSource;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label9: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    Excel1: TMenuItem;
    Excel2: TMenuItem;
    Splitter1: TSplitter;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure Excel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_lotmb2: TForm_lotmb2;

implementation
 uses damo,unit_progress;



{$R *.dfm}

procedure TForm_lotmb2.BitBtn1Click(Sender: TObject);
begin
     ModalResult := mrOK;
end;

procedure TForm_lotmb2.BitBtn2Click(Sender: TObject);
var
  eaApps1: TExcelApplication;
     y   : integer;
  tsList : TStringList;
  s,s1,t : string;
  aSheet : Variant;
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
  Application.CreateForm(TForm_Progress, Form_Progress);

  eaapps1.Workbooks.Add(xlWBATWorksheet,0);
  eaapps1.worksheets.Add(null,null,1,null,0);
  Form_Progress.show;

  dm.ADOS_19.DisableControls;


  Form_Progress.Label1.Caption :='正在材料实际数据...';
  Form_Progress.stepvalue := 0;
  Form_Progress.Label1.refresh;
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
  begin
     vstr:=chr(DBGridEh1.Columns.Count+1+96);
     //showmessage(  vstr +'  '  +inttostr(DBGridEh1.Columns.Count) );
  end
  else begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh1.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh1.Columns.Count+1-26*int((DBGridEh1.Columns.Count+1)/26)+96)));
  end;
  //  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='材料实际数据';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  //asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('cut_date').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh1.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='材料实际数据';
  {}
  dm.ADOS_19.EnableControls;
  dm.ADOS_20.DisableControls;

  Form_Progress.Label1.Caption :='正在材料标准数据...';
  Form_Progress.stepvalue := 0;
  Form_Progress.Label1.refresh;
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
  asheet.cells[1,3]:='材料标准';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  //asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('cut_date').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh2.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='材料标准';
  {}
  dm.ADOS_20.EnableControls;
  eaapps1.Visible[0]:=true;         // display Excel files
  Form_Progress.free;

end;

procedure TForm_lotmb2.Excel1Click(Sender: TObject);
var
  eaApps1: TExcelApplication;
     y   : integer;
  tsList : TStringList;
  s,s1,t : string;
  aSheet : Variant;
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
  Application.CreateForm(TForm_Progress, Form_Progress);

  eaapps1.Workbooks.Add(xlWBATWorksheet,0);
  //eaapps1.worksheets.Add(null,null,0,null,0);
  Form_Progress.show;

  dm.ADOS_19.DisableControls;


  Form_Progress.Label1.Caption :='正在材料实际数据...';
  Form_Progress.stepvalue := 0;
  Form_Progress.Label1.refresh;
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
  begin
     vstr:=chr(DBGridEh1.Columns.Count+1+96);
     //showmessage(  vstr +'  '  +inttostr(DBGridEh1.Columns.Count) );
  end
  else begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh1.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh1.Columns.Count+1-26*int((DBGridEh1.Columns.Count+1)/26)+96)));
  end;
  //  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='材料实际数据';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  //asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('cut_date').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh1.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='材料实际数据';
  {}
  dm.ADOS_19.EnableControls;

  eaapps1.Visible[0]:=true;         // display Excel files
  Form_Progress.free;

end;


procedure TForm_lotmb2.Excel2Click(Sender: TObject);
var
  eaApps1: TExcelApplication;
     y   : integer;
  tsList : TStringList;
  s,s1,t : string;
  aSheet : Variant;
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
  Application.CreateForm(TForm_Progress, Form_Progress);

  eaapps1.Workbooks.Add(xlWBATWorksheet,0);
  //eaapps1.worksheets.Add(null,null,1,null,0);
  Form_Progress.show;


  dm.ADOS_20.DisableControls;

  Form_Progress.Label1.Caption :='正在材料标准数据...';
  Form_Progress.stepvalue := 0;
  Form_Progress.Label1.refresh;
  aSheet:=eaapps1.Worksheets[1];

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
  asheet.cells[1,3]:='材料标准';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  //asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('cut_date').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh2.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='材料标准';
  {}
  dm.ADOS_20.EnableControls;
  eaapps1.Visible[0]:=true;         // display Excel files
  Form_Progress.free;

end;


end.
