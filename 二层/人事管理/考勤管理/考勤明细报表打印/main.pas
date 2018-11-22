unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppBands, ppCache, ppClass, ppEndUsr, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, StdCtrls, ppPrnabl, ppCtrls,
  ComCtrls, ppVar, ppModule, daDataModule, Grids, DBGridEh, ExtCtrls,DateUtils,
  Buttons, Menus;

type
  Tfrm_Main = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    DBGrd1: TDBGridEh;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine2: TppLine;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine18: TppLine;
    ppLine36: TppLine;
    ppLine47: TppLine;
    ppLine49: TppLine;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppLine45: TppLine;
    ppDBText6: TppDBText;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine1: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine34: TppLine;
    ppLabel7: TppLabel;
    ppLine35: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine37: TppLine;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLine44: TppLine;
    ppLine46: TppLine;
    ppLabel34: TppLabel;
    ppLine48: TppLine;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLabel22: TppLabel;
    ppLine17: TppLine;
    ppLine33: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine50: TppLine;
    ppLabel27: TppLabel;
    ppLabel29: TppLabel;
    ppLine55: TppLine;
    ppLabel28: TppLabel;
    ppLabel30: TppLabel;
    daDataModule1: TdaDataModule;
    ppDesigner1: TppDesigner;
    SGrd: TStringGrid;
    DBGrd2: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDBPipeline1: TppDBPipeline;
    Popup1: TPopupMenu;
    N1: TMenuItem;
    Button4: TButton;
    Button6: TButton;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DBGrd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    sortDate:TDateTime;
    longDate:TDateTime;
    preColumn:TColumnEh;
    sql_Text:string;
    sql_Text1: string;
  //  i:Integer;
    procedure DeleteRow(Row: Integer);
  public
    { Public declarations }
  end;

var
  frm_Main: Tfrm_Main;

implementation

uses dmo, common;

{$R *.dfm}


procedure Tfrm_Main.FormShow(Sender: TObject);
begin
  with DM.ADOQuery2 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select getdate() as v_date');
    Active:=True;
    sortDate:=StrToDate(FormatDateTime('yyyy-MM-dd',FieldValues['v_date']));
    longDate:=FieldValues['v_date'];
    dtpk1.Date:=sortDate-dayof(sortDate)+1;
    dtpk2.Date:=sortDate;
  end;
  with DM.ADODataSet1 do
  begin
    Close;
    Parameters.ParamByName('rkey73').Value:=rkey73;
    sql_Text1:=DM.ADODataSet1.CommandText;
    Open;
    Label2.Caption := IntToStr(RecordCount);
  end;
  sql_Text:=DM.ADODataSet2.CommandText;
  preColumn:=DBGrd1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
  Edit1.SetFocus;
  SGrd.Cells[0,0]:='员工工号';
  SGrd.Cells[1,0]:='员工姓名';
  SGrd.Cells[2,0]:='部门';
end;

procedure Tfrm_Main.BitBtn1Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName:=
   StringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'hr_AttendanceReport.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.SaveAsTemplate:=False;
  ppReport1.Print;
end;

procedure Tfrm_Main.BitBtn2Click(Sender: TObject);
begin
  if not DM.ADODataSet2.IsEmpty then
    Export_dbGridEH_to_Excel(DBGrd2,Application.Title);
end;

procedure Tfrm_Main.BitBtn3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_Main.DBGrd1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADODataSet1.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADODataSet1.IndexFieldNames:=Column.FieldName;
  end;
  if Column.Tag<>1 then
  begin
    if (preColumn.FieldName<>Column.FieldName) then
    begin
      Label1.Caption:=Column.Title.Caption;
      preColumn:=Column;
    end;
  end;
end;

procedure Tfrm_Main.Edit1Change(Sender: TObject);
begin
  if (trim(Edit1.Text)<>'')then
    DM.ADODataSet1.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    DM.ADODataSet1.Filter:='';
   Label2.Caption := IntToStr(DM.ADODataSet1.RecordCount);
end;

procedure Tfrm_Main.Button1Click(Sender: TObject);
var
  k:Integer;
  GridSelectRows:Integer;
begin
  if DBGrd1.SelectedRows.Count >=1 then
  begin
    for GridSelectRows:= DBGrd1.SelectedRows.Count -1 downto 0 do
    begin
      DBGrd1.DataSource.DataSet.  GotoBookmark(pointer(DBGrd1.SelectedRows.Items[GridSelectRows]));
      for k := 0 to SGrd.RowCount-2 do
      begin
        if DM.ADODataSet1employeecode.Value=SGrd.Cells[0,k] then
          Exit;
      end;
        SGrd.RowCount:=SGrd.RowCount+1;
        SGrd.Cells[0,SGrd.RowCount-2]:=DM.ADODataSet1employeecode.Value;
        SGrd.Cells[1,SGrd.RowCount-2]:=DM.ADODataSet1chinesename.Value;
        SGrd.Cells[2,SGrd.RowCount-2]:=DM.ADODataSet1departmentname.Value;
  //    i:=i+1;
      
    end  ;
  end
  else
  begin
    for k := 0 to SGrd.RowCount-2 do
    begin
      if DM.ADODataSet1employeecode.Value=SGrd.Cells[0,k] then
        Exit;
    end;
   // ShowMessage(IntToStr(SGrd.RowCount));
   //if SGrd.Cells[0,1] <>'' then
    SGrd.RowCount:=SGrd.RowCount+1;
    //i:=i+1;
    SGrd.Cells[0,SGrd.RowCount-2]:=DM.ADODataSet1employeecode.Value;
    SGrd.Cells[1,SGrd.RowCount-2]:=DM.ADODataSet1chinesename.Value;
    SGrd.Cells[2,SGrd.RowCount-2]:=DM.ADODataSet1departmentname.Value;

   // SGrd.RowCount:=SGrd.RowCount+1;
  end;
  DBGrd1.SelectedRows.Clear;  
//  for k := 0 to SGrd.RowCount-2 do
//  begin
//    if DM.ADODataSet1employeecode.Value=SGrd.Cells[0,k] then
//      Exit;
//  end;
//  SGrd.Cells[0,i]:=DM.ADODataSet1employeecode.Value;
//  SGrd.Cells[1,i]:=DM.ADODataSet1chinesename.Value;
//  SGrd.Cells[2,i]:=DM.ADODataSet1departmentname.Value;
//  i:=i+1;
//  SGrd.RowCount:=SGrd.RowCount+1;
 // label6.Caption := IntToStr(SGrd.RowCount - 2);
end;

procedure Tfrm_Main.Button2Click(Sender: TObject);
var
  k:Integer;
begin
  if SGrd.RowCount-2>=0 then
  begin
    SGrd.RowCount:=2;
    SGrd.Cells[0,1]:='';
    SGrd.Cells[1,1]:='';
    SGrd.Cells[2,1]:='';
    SGrd.Cells[3,1]:='';
 //   i:=1;
  end;
  DM.ADODataSet1.DisableControls;
  DM.ADODataSet1.First;
  while not DM.ADODataSet1.Eof do
  begin
    SGrd.RowCount:=SGrd.RowCount+1;
    SGrd.Cells[0,SGrd.RowCount-2]:=DM.ADODataSet1employeecode.Value;
    SGrd.Cells[1,SGrd.RowCount-2]:=DM.ADODataSet1chinesename.Value;
    SGrd.Cells[2,SGrd.RowCount-2]:=DM.ADODataSet1departmentname.Value;
    DM.ADODataSet1.Next;
   // i:=i+1;
    
  end;
  DM.ADODataSet1.EnableControls;
  SGrd.Cells[0,SGrd.RowCount-1]:='';
  SGrd.Cells[1,SGrd.RowCount-1]:='';
  SGrd.Cells[2,SGrd.RowCount-1]:='';
  SGrd.Cells[3,SGrd.RowCount-1]:='';
 // label6.Caption := IntToStr(SGrd.RowCount - 2);
 { if SGrd.RowCount-2>=0 then
  begin
    SGrd.RowCount:=2;
    SGrd.Cells[0,1]:='';
    SGrd.Cells[1,1]:='';
    SGrd.Cells[2,1]:='';
    SGrd.Cells[3,1]:='';
    i:=1;
  end;
  DM.ADODataSet1.DisableControls;
  DM.ADODataSet1.First;
  while not DM.ADODataSet1.Eof do
  begin
    SGrd.Cells[0,i]:=DM.ADODataSet1employeecode.Value;
    SGrd.Cells[1,i]:=DM.ADODataSet1chinesename.Value;
    SGrd.Cells[2,i]:=DM.ADODataSet1departmentname.Value;
    DM.ADODataSet1.Next;
    i:=i+1;
    SGrd.RowCount:=SGrd.RowCount+1;
  end;
  DM.ADODataSet1.EnableControls;
  SGrd.Cells[0,SGrd.RowCount-1]:='';
  SGrd.Cells[1,SGrd.RowCount-1]:='';
  SGrd.Cells[2,SGrd.RowCount-1]:='';
  SGrd.Cells[3,SGrd.RowCount-1]:='';  }
end;

procedure Tfrm_Main.Button5Click(Sender: TObject);
var
  k:Integer;
  str:string;
begin
  try
    Screen.Cursor := crHourGlass;
    if   (DBGrd1.DataSource.DataSet.IsEmpty=False)   then
    with DM.ADODataSet2 do
    begin
      Close;
      Parameters[0].Value:=StrToDate(FormatDateTime('yyyy-MM-dd',dtpk1.Date));
      Parameters[1].Value:=StrToDate(FormatDateTime('yyyy-MM-dd',dtpk2.Date));
      if CheckBox1.Checked then
        CommandText:=sql_Text+' and employeecode in ('
      else
        CommandText:=sql_Text+' and isnull(outdutytime,'''')='''' and employeecode in (';
     // ShowMessage(CommandText);
      if (SGrd.RowCount-2<=0) then
      begin
        if MessageDlg('确定要查询所有人员的考勤？',mtInformation,[mbYes,mbNo],0)=mrNo then
        begin
          Exit;
        end;

        DM.ADODataSet1.DisableControls;
        DM.ADODataSet1.First;
        while not DM.ADODataSet1.Eof do
        begin
          str:=str+QuotedStr(Trim(DM.ADODataSet1employeecode.AsString))+',';
          //ShowMessage(str);
          DM.ADODataSet1.Next;

        end;
        DM.ADODataSet1.EnableControls;
      end
      else
      begin
        for k := 1 to SGrd.RowCount-2 do
          str:=str+QuotedStr(Trim(SGrd.Cells[0,k])) +',';
      end;
      str:=Copy(str,1,Length(str)-1);
      CommandText:=CommandText+str+') order by ChineseName,日';
     // ShowMessage(CommandText);
      Open;
    end;
  finally    
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Main.N1Click(Sender: TObject);
var
  k:Byte;
begin
  if SGrd.RowCount>2 then
  begin
    for k := SGrd.Row to SGrd.RowCount-2 do
      SGrd.Rows[k].Text:=SGrd.Rows[k+1].Text;
    SGrd.RowCount:=SGrd.RowCount-1;
  end
  else
    SGrd.Rows[SGrd.Row].Clear;
end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
begin
   if not app_init_2(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;    
  Self.Caption:=Application.Title;
 { dm.ADOConn.Close;
  dm.ADOConn.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConn.Open;
  rkey73 := '2522';
  vprev:='2';  }
end;

procedure  Tfrm_Main.DeleteRow(Row: Integer);
var
  j: integer;
begin
  if (Row < SGrd.RowCount) and (Row > SGrd.FixedRows - 1) then
  begin
    if Row < SGrd.RowCount - 1 then
    begin
      for j := Row to SGrd.RowCount - 1 do
      begin
        SGrd.Rows[j] := SGrd.Rows[j + 1];
      end;
    end
    else SGrd.Rows[Row].Clear;
    SGrd.RowCount := SGrd.RowCount - 1;
    if  SGrd.RowCount = 1 then
    begin

      SGrd.RowCount := SGrd.RowCount + 1;
      SGrd.FixedRows := 1 ;
    end;
  end;
end;

procedure Tfrm_Main.Button4Click(Sender: TObject);
{var
  Sel: TGridRect;
  i: Integer;
begin
  Sel := SGrd.Selection;
  DeleteRow(Sel.Top); }
var
  k:Byte;
begin
  if SGrd.Row< SGrd.RowCount-1 then
  if SGrd.RowCount>=2 then
  begin
   // ShowMessage(IntToStr(SGrd.Row));
    for k := SGrd.Row to SGrd.RowCount-1 do
      SGrd.Rows[k].Text:=SGrd.Rows[k+1].Text;
    if SGrd.RowCount>2then
    SGrd.RowCount:=SGrd.RowCount-1;
  //  i:=i-1;
  end
  else
    begin
    SGrd.Rows[SGrd.Row].Clear;
//    i:=1;
    end;
 // label6.Caption := IntToStr(SGrd.RowCount - 2);    
{  if SGrd.>2 then
  begin
    for k := SGrd.Row to SGrd.RowCount-2 do
      SGrd.Rows[k].Text:=SGrd.Rows[k+1].Text;
    SGrd.RowCount:=SGrd.RowCount-1;
  end
  else
    SGrd.Rows[SGrd.Row].Clear; }
end;

procedure Tfrm_Main.Button6Click(Sender: TObject);
var
  i_row:Integer;
begin
  for i_row := 1 to SGrd.RowCount - 1 do
  begin
    SGrd.Rows[i_row].Clear;
  end;
  SGrd.RowCount:=2;
 // label6.Caption := IntToStr(SGrd.RowCount - 2);  
end;

procedure Tfrm_Main.DBGrd2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)
//    else
//    if   DataSet is TClientDataSet then
//      showmessage((DataSet as  TClientDataSet).CommandText)  ;
  end;
end;

procedure Tfrm_Main.DBGrd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText);
  end;
end;

procedure Tfrm_Main.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    DM.ADODataSet1.Close;
    DM.ADODataSet1.CommandText := sql_Text1;
    DM.ADODataSet1.Open;
  end;
  if CheckBox1.Checked = False then
  begin
    DM.ADODataSet1.Close;
    DM.ADODataSet1.CommandText := sql_Text1 + ' and status=1';
    DM.ADODataSet1.Open;
  end;
end;

end.
