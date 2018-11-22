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
    ComboBox1: TComboBox;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDBPipeline1: TppDBPipeline;
    Popup1: TPopupMenu;
    N1: TMenuItem;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn4: TBitBtn;
    Button3: TButton;
    ProgressBar1: TProgressBar;
    Label11: TLabel;
    Image1: TImage;
    StaticText1: TStaticText;
    N2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrd2TitleClick(Column: TColumnEh);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure dtpk2Exit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGrd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    sortDate:TDateTime;
    longDate:TDateTime;
    preColumn:TColumnEh;
    preColumn2 :TColumnEh;
    sql_Text,orginal_sql_text:string;
    i:Integer;
  public
    { Public declarations }
  end;

var
  frm_Main: Tfrm_Main;

implementation

uses dmo, common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure Tfrm_Main.FormShow(Sender: TObject);
begin
  {with dm.ADOTIME do
  begin
    Active:=False; 
    Active:=True;
    sortDate:=FieldValues['time1'];
    longDate:=FieldValues['time2'];
    dtpk1.Date:=sortDate;
    dtpk2.Date:=longDate;
  end;}
  with DM.ADODataSet1 do
  begin
    Close;
    Parameters[0].Value:=dtpk1.Date;
    Parameters[1].Value:=dtpk1.Date;
    Parameters[2].Value:=dtpk2.Date;
    Parameters[3].Value:=StrToInt(common.rkey73);
    Open;
    label5.Caption := inttostr(dm.ADODataSet1.RecordCount);
  end;
  //sql_Text:=DM.ADODataSet2.CommandText;
  preColumn:=DBGrd1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
  Edit1.SetFocus;
  SGrd.Cells[0,0]:='员工工号';
  SGrd.Cells[1,0]:='员工姓名';
  SGrd.Cells[2,0]:='部门';
  i:=1;
  ComboBox1.Clear;
  with DM.ADOQuery2 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select departmentname from datadepartment');
    Active:=True;
    DisableControls;
    First;
    while not Eof do
    begin
      ComboBox1.Items.Add(FieldValues['departmentname']);
      Next;
    end;
    EnableControls;
    ComboBox1.ItemIndex:=0;
    ComboBox1.Visible:=False;
    bitbtn4.Visible := false;
  end;

end;

procedure Tfrm_Main.BitBtn1Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName:=
   StringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'1.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.SaveAsTemplate:=False;
  ppReport1.Print;
end;

procedure Tfrm_Main.BitBtn2Click(Sender: TObject);
begin 
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
    if preColumn.FieldName<>Column.FieldName then
    begin
      Label1.Caption:=Column.Title.Caption;
      preColumn:=Column;
    end;
  end;

  if (Column.Title.Caption='员工工号') or (Column.Title.Caption='员工姓名') then
  begin
    Label1.Visible:=True;
    Edit1.Visible:=True;
    Edit1.Text:='';
    Edit1.SetFocus;
    bitbtn4.Visible := false;

    //ComboBox1.Visible:=False;
  end;
  if Column.Title.Caption='部门' then
  begin
    Label1.Visible:=True;
    //ComboBox1.Visible:=True;
    bitbtn4.Visible := true;
    Edit1.Visible:=true;   end;
  if (Column.Title.Caption='入职日期') or (Column.Title.Caption='离职日期') then
  begin
    Label1.Visible:=False;
    Edit1.Visible:=False;
    bitbtn4.Visible := false;
   // ComboBox1.Visible:=False;
  end;
end;

procedure Tfrm_Main.Edit1Change(Sender: TObject);
begin 
  if Trim(Edit1.Text)<>'' then
    DM.ADODataSet1.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    DM.ADODataSet1.Filter:='';
  label5.Caption := inttostr(dm.ADODataSet1.RecordCount);     
end;

procedure Tfrm_Main.Button1Click(Sender: TObject);
var
  k:Integer;
  GridSelectRows:Integer;
begin
  if DBGrd1.SelectedRows.Count >1 then
  begin
    for GridSelectRows:= DBGrd1.SelectedRows.Count -1 downto 0 do
    begin
      DBGrd1.DataSource.DataSet.GotoBookmark(pointer(DBGrd1.SelectedRows.Items[GridSelectRows]));
      for k := 0 to SGrd.RowCount-2 do
      begin
        if DM.ADODataSet1employeecode.Value=SGrd.Cells[0,k] then
          Exit;
      end;
        SGrd.RowCount:=SGrd.RowCount+1;
        SGrd.Cells[0,SGrd.RowCount-2]:=DM.ADODataSet1employeecode.Value;
        SGrd.Cells[1,SGrd.RowCount-2]:=DM.ADODataSet1chinesename.Value;
        SGrd.Cells[2,SGrd.RowCount-2]:=DM.ADODataSet1departmentname.Value;
    end  ;
  end
  else
  begin
    for k := 0 to SGrd.RowCount-2 do
    begin
      if DM.ADODataSet1employeecode.Value=SGrd.Cells[0,k] then
        Exit;
    end;
    SGrd.RowCount:=SGrd.RowCount+1;
    SGrd.Cells[0,SGrd.RowCount-2]:=DM.ADODataSet1employeecode.Value;
    SGrd.Cells[1,SGrd.RowCount-2]:=DM.ADODataSet1chinesename.Value;
    SGrd.Cells[2,SGrd.RowCount-2]:=DM.ADODataSet1departmentname.Value;
    SGrd.Cells[3,SGrd.RowCount-2]:=dm.ADODataSet1accountname.Value;
  end;
  DBGrd1.SelectedRows.Clear;
  label7.Caption :=  inttostr(sgrd.RowCount-2);
end;
{procedure Tfrm_Main.Button1Click(Sender: TObject);
var
  k:Byte;
begin
  for k := 0 to SGrd.RowCount-2 do
  begin
    if DM.ADODataSet1employeecode.Value=SGrd.Cells[0,k] then
      Exit;
  end;
  SGrd.Cells[0,i]:=DM.ADODataSet1employeecode.Value;
  SGrd.Cells[1,i]:=DM.ADODataSet1chinesename.Value;
  SGrd.Cells[2,i]:=dm.ADODataSet1departmentname.Value;
  SGrd.Cells[3,i]:=dm.ADODataSet1accountname.Value;
  i:=i+1;
  SGrd.RowCount:=SGrd.RowCount+1;
  label7.Caption :=  inttostr(sgrd.RowCount-2);
end;
 }
procedure Tfrm_Main.Button2Click(Sender: TObject);
var
  k:Byte;
begin
  if SGrd.RowCount-2>=0 then
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
    SGrd.Cells[2,i]:=dm.ADODataSet1departmentname.Value;
    SGrd.Cells[3,i]:=dm.ADODataSet1accountname.Value;
    DM.ADODataSet1.Next;
    i:=i+1;
    SGrd.RowCount:=SGrd.RowCount+1;
  end;
  DM.ADODataSet1.EnableControls;
  SGrd.Cells[0,SGrd.RowCount-1]:='';
  SGrd.Cells[1,SGrd.RowCount-1]:='';
  SGrd.Cells[2,SGrd.RowCount-1]:='';
  SGrd.Cells[3,SGrd.RowCount-1]:='';
  label7.Caption :=  inttostr(sgrd.RowCount-2);
  //showmessage(inttostr(sgrd.RowCount));
end;


procedure Tfrm_Main.ComboBox1Change(Sender: TObject);
begin
  DM.ADODataSet1.Filter:=preColumn.FieldName+' like '''+ComboBox1.Text+'''';
  label5.Caption := inttostr(dm.ADODataSet1.RecordCount);
end;

procedure Tfrm_Main.Button5Click(Sender: TObject);
var
  k: Integer;
  str:string;
  n,i,j: Integer;
begin
   button5.Enabled := false;
   ProgressBar1.Position := 0 ;
   ProgressBar1.Visible := True ;
   StaticText1.Caption := '程序运行中,请稍后...';
   Application.ProcessMessages;
   dm.onoffduty_show.Parameters[0].Value := StrToDate(FormatDateTime('yyyy-MM-dd',dtpk1.Date));
   dm.onoffduty_show.Parameters[1].Value := StrToDate(FormatDateTime('yyyy-MM-dd',dtpk2.Date));

  if (SGrd.RowCount-2<=0) and (strtoint(vprev) <>4) then
  begin
    showmessage('请选择员工');
    abort;
  end;

    dm.employee_list_create.ExecSQL;
    dm.onoffduty_create.ExecSQL;
if (SGrd.RowCount-2<=0) and (strtoint(vprev) =4 )then
    begin
      if MessageDlg('确定要查询所有人员的考勤？',mtInformation,[mbYes,mbNo],0) = 6 then
        begin
          dm.ADOTMP.SQL.Text :=' truncate table #temp_employeecode ';
          dm.ADOTMP.ExecSQL;
          DM.ADODataSet1.DisableControls;
          DM.ADODataSet1.First;
        while not DM.ADODataSet1.Eof do
            begin
            str:=DM.ADODataSet1employeecode.Value;
            dm.ADOTMP.SQL.Text :=' insert into #temp_employeecode select' + #39+str+#39;
            dm.ADOTMP.ExecSQL;
            DM.ADODataSet1.Next;
            end;
          DM.ADODataSet1.EnableControls;
        end;
  end
  else
    begin
      dm.ADOTMP.SQL.Text :=' truncate table #temp_employeecode ';
      dm.ADOTMP.ExecSQL;
        n := SGrd.RowCount;
         for k := 1 to n-1 do
         begin
          str:=SGrd.Cells[0,k];
          dm.ADOTMP.SQL.Text :=' insert into #temp_employeecode select ' + #39+str+#39;
          dm.ADOTMP.ExecSQL;
          //showmessage(inttostr(k));
         end;
    end;
   ProgressBar1.Position := 30;
   application.ProcessMessages;

   if CheckBox1.Checked then
      dm.onoffdutydata_T.SQL.Text:=
      stringreplace(dm.onoffdutydata_T.SQL.Text,'outduty_flag<>1','1=1',[rfReplaceAll])
    else
      dm.onoffdutydata_T.SQL.Text:=
      stringreplace(dm.onoffdutydata_T.SQL.Text,'1=1','outduty_flag<>1',[rfReplaceAll]);
     try 
       DBGrd2.Cursor:=crHourGlass;
      dm.onoffduty_show.ExecSQL;
      application.ProcessMessages;
      DBGrd2.Cursor := crDefault;
      ProgressBar1.Position := 100;
      dm.onoffdutydata_T.ExecSQL;
      dm.onoffdutydata_T.Open; 
      StaticText1.Caption := '查询完毕';
      progressbar1.Visible := false ;
       Application.ProcessMessages;
    except 
      showmessage('查询失败');
    end;
  preColumn2:=DBGrd2.Columns[0];
  button5.Enabled := true;
  //label9.Caption := inttostr(dm.ADODataSet2.RecordCount);
  label9.Caption := inttostr(dm.onoffdutydata_T.RecordCount);
  dbgrd2.FrozenCols := 5;
  dbgrd2.Columns[0].Width:=60;
  dbgrd2.Columns[1].Width:=45;
  dbgrd2.Columns[2].Width:=45;
  dbgrd2.Columns[3].Width:=45;
  dbgrd2.Columns[4].Width:=45;
  //开始排日期
  for k := 5 to 35 do
    begin
      dbgrd2.Columns[k].Width:=30;
    end;
  dbgrd2.Columns[36].Width:=40;
  for k := 37 to 38 do
    begin
      dbgrd2.Columns[k].Width:=20;
    end;
  for k := 39 to 47 do
    begin
      dbgrd2.Columns[k].Width:=40;
    end;
   application.ProcessMessages;
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
  label7.Caption :=  inttostr(sgrd.RowCount-2);
end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
begin
  if not app_init_2(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  Self.Caption:=Application.Title;
  //

   dtpk1.Date :=strToDate(formatdatetime('yyyy-mm-',now)+'01');
   dtpk2.Date := EndOfTheMonth(dtpk1.Date);
  //dtpk2.DateTime := EndOfTheMonth(dtpk1.Date);
  //
  //ShowMessage(FormatDateTime('yyyy-mm-dd',dtpk2.Date));
  //orginal_sql_text := dm.ADODataSet2.CommandText;
  //showmessage(dm.ADODataSet1.CommandText);
  //DM.ADODataSet1.Open;    
  if (strtoint(vprev) = 4) then
  begin
   button3.Visible := true;
   button3.Enabled := true;
  end;
end;



procedure Tfrm_Main.DBGrd2TitleClick(Column: TColumnEh);
begin
     if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADODataSet2.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADODataSet2.IndexFieldNames:=Column.FieldName;
  end;
  if Column.Tag<>1 then
  begin
    if preColumn.FieldName<>Column.FieldName then
    begin
      preColumn2:=Column;
    end;
  end;

end;

procedure Tfrm_Main.BitBtn4Click(Sender: TObject);
var
InputVar: PDlgInput ;
begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'departmentname/部门/400';
    InputVar.Sqlstr :=
    'select rkey,departmentname,departmentcode from datadepartment where departmentname not like '+#39+'%停用%'+#39;
    try
        inputvar.KeyField :='rkey';
        InputVar.AdoConn := dm.ADOConn;
        frmPick_Item_Single.InitForm_New(InputVar);
        if frmPick_Item_Single.ShowModal=mrok then
        begin
            edit1.Text := trim(frmPick_Item_Single.adsPick.FieldValues['departmentname']);
            edit1.Tag := StrToInt(trim(frmPick_Item_Single.adsPick.FieldValues['rkey']));
            combobox1.Text := edit1.Text;
        end;
    finally
        frmPick_Item_Single.adsPick.Close;
        frmPick_Item_Single.Free ;
    end;
end;

procedure Tfrm_Main.Button3Click(Sender: TObject);
var
  k: Integer;
  str:string;
  n: Integer;
begin
StaticText1.Caption := '程序运行中,请稍后...';
   Application.ProcessMessages;
   n := SGrd.RowCount;
  if ((SGrd.RowCount-1<=0) or (SGrd.Cells[0,1]=''))  then
  begin
    showmessage('请选择员工');
    abort;
  end;
  progressbar1.Visible := true;

  if  ((SGrd.RowCount>=2) and  (SGrd.Cells[0,1]<>''))  then
    for k := 1 to n-1 do
    begin
    str:=SGrd.Cells[0,k];
    dm.ADOTMP.SQL.Clear;
    dm.ADOTMP.SQL.Text :=' exec hrsp_workhours_mark '+ #39+str+#39+','+
      #39+FormatDateTime('yyyy-MM',dtpk1.Date)+#39;
    dm.ADOTMP.ExecSQL;
    progressbar1.Position := Trunc(100*k/n);
    application.ProcessMessages;
    //showmessage(dm.ADOTMP.SQL.Text);
    end;
  progressbar1.Visible := false ;
  StaticText1.Caption := '标识处理完毕';
  Application.ProcessMessages;
end;

procedure Tfrm_Main.dtpk1Exit(Sender: TObject);
begin
{  with DM.ADODataSet1 do
  begin
    Close;
    Parameters[0].Value:=dtpk1.Date;
    Parameters[1].Value:=dtpk1.Date;
    Parameters[2].Value:=dtpk2.Date;
    Parameters[3].Value:=common.rkey73;
    Open;
    label5.Caption := inttostr(dm.ADODataSet1.RecordCount);
  end;   }
end;

procedure Tfrm_Main.dtpk2Exit(Sender: TObject);
begin
  with DM.ADODataSet1 do
  begin
    Close;
    Parameters[0].Value:=dtpk1.Date;
    Parameters[1].Value:=dtpk1.Date;
    Parameters[2].Value:=dtpk2.Date;
    Parameters[3].Value:=StrToInt(common.rkey73);
    Open;
    label5.Caption := inttostr(dm.ADODataSet1.RecordCount); 
  end;
end;

procedure Tfrm_Main.N2Click(Sender: TObject);
var k:integer;
begin
   for k := 0 to SGrd.RowCount-1 do
  begin
     SGrd.Rows[k].Clear;
  end;
  sgrd.RowCount := 2;
  SGrd.Cells[0,0]:='员工工号';
  SGrd.Cells[1,0]:='员工姓名';
  SGrd.Cells[2,0]:='部门';
  SGrd.Cells[3,0]:='帐套';
  label7.Caption :='0'
end;

procedure Tfrm_Main.DBGrd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if (ssAlt in Shift)  and  (Key=86) then
   showmessage(DM.ADODataSet1.commandtext + #13
   +' rkey73'+ common.rkey73
   +#13+'startdate1 :'+ Formatdatetime('YYYY-MM-DD',dtpk1.Date)
   +#13+'startdate2 :'+ Formatdatetime('YYYY-MM-DD',dtpk1.Date)
   +#13+'enddate3:'+ Formatdatetime('YYYY-MM-DD',dtpk2.Date));
end;

end.
