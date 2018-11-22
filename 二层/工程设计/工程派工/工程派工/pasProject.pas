unit pasProject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls,
  DBClient, Provider,StrUtils;

type
  TfrmProject = class(TForm)
    Panel5: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    PopupMenu2: TPopupMenu;
    PopupMenu1: TPopupMenu;
    DataSource1: TDataSource;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    BitBtn3: TBitBtn;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    DSP: TDataSetProvider;
    CDS: TClientDataSet;
    N5: TMenuItem;
    RadioGroup1: TRadioGroup;
    btn1: TButton;
    CAM1: TMenuItem;
    N6: TMenuItem;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CDSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure CAM1Click(Sender: TObject);
  private
    { Private declarations }
    Sqlstr:string;
    strSQLTxt:string;
    StartDate,EndDate:TDatetime;
    PreColumn: TColumnEh;
    field_name:string;
    Rk419:Integer;
    sWhereIN:string;
    Rkey05:string;
    function GetCheckBox():string;
  public
    { Public declarations }
  end;

var
  frmProject: TfrmProject;

implementation

uses PasDM, PasQuery,ConstVar,common, pasSetFieldName,Pick_Item_Single,
  sumqryfrm,sumqryehfrm, DateUtils;

{$R *.dfm}
function TfrmProject.GetCheckBox():string;
var sTp:string;
    i:Integer;
begin
  sTp:='';
  for i:=1 to 10 do
   if TCheckBox(FindComponent('checkBox'+inttostr(i))).Checked then
     sTp:=sTp+inttostr(TCheckBox(GroupBox1.Controls[i]).Tag)+',';
  Result:=' and DATA0538.STATUS in ('+sTp+'159)';
end;

procedure TfrmProject.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmProject.BitBtn4Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption) ;
end;

procedure TfrmProject.BitBtn1Click(Sender: TObject);
var i,j,iNo:integer;
    strText,sTemp:string;
begin
  if StartDate > 100 then
    FrmQuery.DateTimePicker3.Date:= StartDate
  else
    FrmQuery.DateTimePicker3.Date:= IncDay(getsystem_date(DM.tmp,1),-100);
  if EndDate > 100 then
    FrmQuery.DateTimePicker5.Date:= EndDate
  else
    FrmQuery.DateTimePicker5.Date:=getsystem_date(DM.tmp,1);
  FrmQuery.ListBox3.ItemIndex := FrmQuery.iItem;
  sWhereIN:=GetCheckBox();
  Sqlstr:='';
  if FrmQuery.ShowModal=mrok then
  begin
    screen.Cursor:=crHourGlass;
    iNo:=0;
    for i:=1 to FrmQuery.SGrid1.RowCount-2 do
    if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    try
      DM.Ado538.DisableControls;
      DM.Ado538.Close;
      DM.Ado538.SQL.Clear;
      DM.Ado538.SQL.Text:=strSQLTxt+' where 1=1 '+Sqlstr+sWhereIN+' and DATA0538.curr_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
                           ''' and DATA0538.curr_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date)+''' order by DATA0538.curr_date desc';
      StartDate:=FrmQuery.DateTimePicker3.Date;
      EndDate:=FrmQuery.DateTimePicker5.Date;
      DM.Ado538.Prepared;
      DM.Ado538.Open;
      CDS.Data:=DSP.Data;
    finally
      DM.Ado538.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;

procedure TfrmProject.FormShow(Sender: TObject);
var i:Integer;
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text:='select EMPLOYEE_PTR from data0073 where Rkey='+Rkey73;
    Open;
    if not IsEmpty then
      Rkey05:=FieldByName('EMPLOYEE_PTR').AsString
    else
      Rkey05:='-1';//2570;
  end;
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  strSQLTxt:=dm.Ado538.SQL.Text;
  StartDate:=IncDay(getsystem_date(DM.tmp,1),-100);
  EndDate:=getsystem_date(DM.tmp,1);
  sWhereIN:=GetCheckBox();
  FrmQuery.DateTimePicker3.Date:=StartDate;
  FrmQuery.DateTimePicker5.Date:=EndDate;
  Sqlstr:='';
  with DM.tmp do
  begin
    Close;
    SQL.Text:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
    Open;
    if not IsEmpty then
      Rk419:=FieldByName('rkey').AsInteger
    else
      Rk419:=-1;//2570;
  end;
    DM.Ado538.Close;
    DM.Ado538.SQL.Clear;
    DM.Ado538.SQL.Text:=strSQLTxt+' where 1=1 '+sWhereIN+' and DATA0538.curr_date>='''+formatdatetime('yyyy-mm-dd ',StartDate)+
                         ''' and DATA0538.curr_date<='''+formatdatetime('yyyy-mm-dd ',EndDate)+''' order by DATA0538.curr_date desc';
    DM.Ado538.Prepared;
    DM.Ado538.Open;
//    if not dm.Ado538.IsEmpty then
//    begin
      CDS.Data:=DSP.Data;
      try
        DM.Ado0849.Close;
        DM.Ado0849.Parameters.ParamByName('D419_ptr').Value:=Rk419;
        DM.Ado0849.Parameters.ParamByName('D073_ptr').Value:=rkey73;
        DM.Ado0849.Prepared;
        DM.Ado0849.Open;
        if (not DM.Ado0849.IsEmpty) then
        begin
          DM.CDS2.Data:=DM.DSP2.Data;
          for i:=DBGridEh1.Columns.Count downto 1 do
          begin
            DBGridEh1.Columns.Delete(i-1);
          end;
          dm.CDS2.First;
          dm.CDS2.IndexFieldNames:='FieldOrder';
          dm.CDS2.Filtered:=True;
          DBGridEh1.Columns.Add.FieldName:=CDS.Fields.Fields[0].FieldName;
          DBGridEh1.Columns[0].Title.Caption:='选择';
          DBGridEh1.Columns[0].Width:=35;
          i:=1;
          while not DM.CDS2.Eof do
          begin
            if (dm.CDS2.fieldByName('IsDisplay').Value=True) then
            begin
              DBGridEh1.Columns.Add.FieldName:=dm.CDS2.fieldByName('FieldName').AsString;
              DBGridEh1.Columns[i].Title.Caption:=dm.CDS2.fieldByName('FieldCaption').AsString;
              DBGridEh1.Columns[i].Width:=dm.CDS2.fieldByName('FieldWidth').AsInteger;
              Inc(i);
              dm.CDS2.Next;
            end else dm.CDS2.Next;
          end;
          dm.CDS2.Filtered:=False;
        end else //没有849，保存
        begin
          dm.Ado849s.Close;
          dm.Ado849s.Open;
          for i:=1 to DBGridEh1.FieldCount-1 do
          begin
            DM.Ado849s.Append;
            DM.Ado849s.FieldByName('D419_ptr').Value:=Rk419;
            DM.Ado849s.FieldByName('D073_ptr').Value:=StrToInt(rkey73);
            DM.Ado849s.FieldByName('FormName').Value:='frmProject';
            DM.Ado849s.FieldByName('GridName').Value:='DBGridEh1';
            DM.Ado849s.FieldByName('FieldName').Value:=DBGridEh1.Columns[i].FieldName;;
            DM.Ado849s.FieldByName('FieldCaption').Value:=DBGridEh1.Columns[i].Title.Caption;
            DM.Ado849s.FieldByName('FieldOrder').Value:=i;
            DM.Ado849s.FieldByName('FieldWidth').Value:=DBGridEh1.Columns[i].Width;
            DM.Ado849s.FieldByName('IsDisplay').Value:=1;
            DM.Ado849s.Post;
          end;
        end;
      finally
        DM.Ado538.EnableControls;
      end;
//    end;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[1] ;
  PreColumn.Title.Color := clred ;
  RadioGroup1Click(Sender);
end;

procedure TfrmProject.BitBtn2Click(Sender: TObject);
var strtemp:string;
begin
  if DM.Ado538.IsEmpty then exit;
  strtemp := dm.Ado538MANU_PART_NUMBER.AsString;
  sWhereIN:=GetCheckBox();
  DM.Ado538.Close;
  DM.Ado538.SQL.Clear;
  DM.Ado538.SQL.Text:=strSQLTxt+' where 1=1 '+Sqlstr+sWhereIN+' and DATA0538.curr_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
                       ''' and DATA0538.curr_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date)+''' order by DATA0538.curr_date desc';
  DM.Ado538.Prepared;
  DM.Ado538.Open;
  CDS.Data:=DSP.Data;
  DM.Ado538.Locate('MANU_PART_NUMBER',strtemp,[]);
end;

procedure TfrmProject.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

//  rkey73:='3';
//  user_ptr:='3';
//  vprev:='2';
//  dm.ADOConnection1.Open;
end;

procedure TfrmProject.BitBtn3Click(Sender: TObject);
var i:Integer;
begin
  frmSetFieldName:=TfrmSetFieldName.Create(Application);
  try
    frmSetFieldName.rkey419:= Rk419;
    if frmSetFieldName.ShowModal=mrok then
    begin
      try
        DM.Ado538.DisableControls;
        DM.Ado0849.Close;
        DM.Ado0849.Parameters.ParamByName('D419_ptr').Value:=Rk419;
        DM.Ado0849.Parameters.ParamByName('D073_ptr').Value:=rkey73;
        DM.Ado0849.Prepared;
        DM.Ado0849.Open;
        DM.CDS2.Data:=DM.DSP2.Data;
        if (not DM.CDS2.IsEmpty) then
        begin
          for i:=DBGridEh1.Columns.Count downto 1 do
          begin
            DBGridEh1.Columns.Delete(i-1);
          end;
          DBGridEh1.Columns.Add.FieldName:=CDS.Fields.Fields[0].FieldName;
          DBGridEh1.Columns[0].Title.Caption:='选择';
          DBGridEh1.Columns[0].Width:=35;
          i:=1;
          dm.CDS2.First;
          while not DM.CDS2.Eof do
          begin
            if (dm.CDS2.fieldByName('IsDisplay').Value=True) then
            begin
              DBGridEh1.Columns.Add.FieldName:=dm.CDS2.fieldByName('FieldName').AsString;
              DBGridEh1.Columns[i].Title.Caption:=dm.CDS2.fieldByName('FieldCaption').AsString;
              DBGridEh1.Columns[i].Width:=dm.CDS2.fieldByName('FieldWidth').AsInteger;
              Inc(i);
              dm.CDS2.Next;
            end else dm.CDS2.Next;
          end;
        end;
      finally
        DM.Ado538.EnableControls;
      end;
    end;
  finally
    frmSetFieldName.Free;
  end;
end;

procedure TfrmProject.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (CDS.RecNo=CDS.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.Ado538.SQL.Text);
end;

procedure TfrmProject.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if CDS.FieldByName('STATUS').Value = 1 then
     DBGridEh1.Canvas.Font.Color := clPurple
  else if CDS.FieldByName('STATUS').Value = 3 then
     DBGridEh1.Canvas.Font.Color := clNavy
  else if CDS.FieldByName('STATUS').Value = 4 then
     DBGridEh1.Canvas.Font.Color := clGreen;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmProject.DBGridEh1TitleClick(Column: TColumnEh);
var
  LOP: TIndexOptions;
begin
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   lop:=[];
  end
  else
  begin
   column.Title.SortMarker:=smDownEh;
   LOP := [ixDescending];
  end;
  CDS.IndexDefs.Update;
  if CDS.IndexDefs.IndexOf('index1') >= 0 then
  CDS.DeleteIndex('index1');
  CDS.AddIndex('index1', Column.FieldName, LOP, '');
  CDS.IndexName := 'index1';
  
  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TfrmProject.Edit1Change(Sender: TObject);
begin
//  CDS.Filter:=''+PreColumn.FieldName+' like ''%'+Trim(Edit1.Text)+'%''';
//  CDS.Filtered:=True;
  CDS.Filter := '';
  with CDS do
  if trim(Edit1.Text) <> '' then
  begin
    Filtered := False;
    Filtered := true;
  end
  else
    Filtered := False;
end;

procedure TfrmProject.CheckBox1Click(Sender: TObject);
var strtemp:string;
begin
  sWhereIN:=GetCheckBox();
  DM.Ado538.Close;
  DM.Ado538.SQL.Clear;
  DM.Ado538.SQL.Text:=strSQLTxt+' where 1=1 '+Sqlstr+sWhereIN+' and DATA0538.curr_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
                       ''' and DATA0538.curr_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date)+''' order by DATA0538.curr_date desc';
  DM.Ado538.Prepared;
  DM.Ado538.Open;
  CDS.Data:=DSP.Data;

end;

procedure TfrmProject.CDSFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Assigned(Edit1) then
  if Trim(Edit1.Text) <>'' then
    Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(preColumn.FieldName).AsString),UpperCase(Edit1.Text) ) ;
end;

procedure TfrmProject.PopupMenu1Popup(Sender: TObject);
var iSTATUS:Integer;
begin
  if CDS.IsEmpty then iSTATUS:=-1 else
  iSTATUS:=CDS.fieldBYName('STATUS').AsInteger;
  N1.Enabled:=((vprev='2')or (vprev='4')) and (iSTATUS=0);
  N2.Enabled:=((vprev='2')or (vprev='4')) and (iSTATUS=1);
  N3.Enabled:=((vprev='2')or (vprev='4')) and (iSTATUS=3);
  N4.Enabled:=((vprev='2')or (vprev='4')) and (iSTATUS=4);
  N5.Enabled:=((vprev='2')or (vprev='4')) and ((iSTATUS=4) or ((iSTATUS=5)));
  CAM1.Enabled:=N3.Enabled;
end;

procedure TfrmProject.N1Click(Sender: TObject);
var InputVar: PDlgInput ;
    iNo:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.RecordCount=0 then Exit;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('STATUS').AsInteger<>0)) then
    begin
      ShowMsg('当前状态不正确或是存在多选状态..',1);
      CDS.Filtered:=False;
      CDS.EnableControls;
      screen.Cursor:=crDefault;
      BitBtn2Click(nil);
      CDS.RecNo:=iNo;
      Exit;
    end;
    CDS.Next;
  end;
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  InputVar.Fields := 'EMPL_CODE/员工编号/150,EMPLOYEE_NAME/员工姓名/150,DEPT_NAME/部门名称/150';
  InputVar.Sqlstr :='select data0005.rKey,data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,data0034.dept_name from data0005 inner join data0034 on data0005.EMPLOYEE_ID=data0034.rkey where data0005.ACTIVE_FLAG=''Y'' and data0034.dept_name=''工程部'' order by EMPL_CODE';
  inputvar.KeyField:='EMPL_CODE';
  InputVar.AdoConn := dm.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    Edit1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rKey').AsInteger;
    CDS.First;
    while not CDS.Eof do
    begin
      if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('STATUS').AsInteger=0)) then
      begin
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update data0538 set STATUS=1,YSZP_USER_PTR='+Rkey05+',YSZP_DATE='''+formatdatetime('yyyy-MM-dd hh:mm:ss',getsystem_date(dm.tmp,0))
        +''',YS_USER_PTR='+inttostr(Edit1.Tag)+' where CUST_PART_PTR='''+CDS.fieldBYName('CUST_PART_PTR').AsString+''' and convert(varchar(10),curr_date,120)='''+FormatDateTime('yyyy-MM-dd',CDS.fieldBYName('curr_date').Value)+'''';
        dm.tmp.ExecSQL;
      end;
      CDS.Next;
    end;
  end;
 finally
   frmPick_Item_Single.Free ;
 end;
  CDS.Filtered:=False;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if not CDS.IsEmpty and (cds.RecordCount >= iNo) then
  CDS.RecNo:=iNo;
end;

procedure TfrmProject.N2Click(Sender: TObject);
var iNo:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.RecordCount=0 then Exit;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('STATUS').AsInteger<>1)) then
    begin
      ShowMsg('当前状态不正确或是存在多选状态..',1);
      CDS.Filtered:=False;
      CDS.EnableControls;
      screen.Cursor:=crDefault;
      BitBtn2Click(nil);
      CDS.RecNo:=iNo;
      Exit;
    end;
    CDS.Next;
  end;
  CDS.First;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('STATUS').AsInteger=1) and (CDS.FieldByName('YS_EQ_STATUS').AsInteger<>1)) then
    begin
      dm.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Text:='update data0538 set STATUS=0,YSZP_USER_PTR=null,YSZP_DATE=null,YS_USER_PTR=null where CUST_PART_PTR='''+CDS.fieldBYName('CUST_PART_PTR').AsString+''' and convert(varchar(10),curr_date,120)='''+FormatDateTime('yyyy-MM-dd',CDS.fieldBYName('curr_date').Value)+'''';
      dm.tmp.ExecSQL;
    end;
    CDS.Next;
  end;
  CDS.Filtered:=False;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if not CDS.IsEmpty and (cds.RecordCount >= iNo) then
  CDS.RecNo:=iNo;
end;

procedure TfrmProject.N3Click(Sender: TObject);
var InputVar: PDlgInput ;
    iNo:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.RecordCount=0 then Exit;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('STATUS').AsInteger<>3)) then
    begin
      ShowMsg('当前状态不正确或是存在多选状态..',1);
      CDS.Filtered:=False;
      CDS.EnableControls;
      screen.Cursor:=crDefault;
      BitBtn2Click(nil);
      CDS.RecNo:=iNo;
      Exit;
    end;
    CDS.Next;
  end;
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  InputVar.Fields := 'EMPL_CODE/员工编号/150,EMPLOYEE_NAME/员工姓名/150,DEPT_NAME/部门名称/150';
  InputVar.Sqlstr :='select data0005.rKey,data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,data0034.dept_name from data0005 inner join data0034 on data0005.EMPLOYEE_ID=data0034.rkey where data0005.ACTIVE_FLAG=''Y'' and data0034.dept_name=''工程部'' order by EMPL_CODE';
  inputvar.KeyField:='EMPL_CODE';
  InputVar.AdoConn := dm.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    Edit1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rKey').AsInteger;
    CDS.First;
    while not CDS.Eof do
    begin
      if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('STATUS').AsInteger=3)) then
      begin
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update data0538 set STATUS=4,CAMZP_USER_PTR='+Rkey05+',CAMZP_DATE='''+formatdatetime('yyyy-MM-dd hh:mm:ss',getsystem_date(dm.tmp,0))
        +''',CAM_USER_PTR='+inttostr(Edit1.Tag)+' where CUST_PART_PTR='''+CDS.fieldBYName('CUST_PART_PTR').AsString+''' and convert(varchar(10),curr_date,120)='''+FormatDateTime('yyyy-MM-dd',CDS.fieldBYName('curr_date').Value)+'''';
        dm.tmp.ExecSQL;
      end;
      CDS.Next;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;
  CDS.Filtered:=False;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if not CDS.IsEmpty and (cds.RecordCount >= iNo) then
  CDS.RecNo:=iNo;
end;

procedure TfrmProject.N4Click(Sender: TObject);
var iNo:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.RecordCount=0 then Exit;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('STATUS').AsInteger<>4)) then
    begin
      ShowMsg('当前状态不正确或是存在多选状态..',1);
      CDS.Filtered:=False;
      CDS.EnableControls;
      screen.Cursor:=crDefault;
      BitBtn2Click(nil);
      CDS.RecNo:=iNo;
      Exit;
    end;
    CDS.Next;
  end;
  CDS.First;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('STATUS').AsInteger=4) and (CDS.FieldByName('YS_EQ_STATUS').AsInteger<>1)) then
    begin
      dm.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Text:='update data0538 set STATUS=3,CAMZP_USER_PTR=null,CAMZP_DATE=null,CAM_USER_PTR=null where CUST_PART_PTR='''+CDS.fieldBYName('CUST_PART_PTR').AsString+''' and convert(varchar(10),curr_date,120)='''+FormatDateTime('yyyy-MM-dd',CDS.fieldBYName('curr_date').Value)+'''';
      dm.tmp.ExecSQL;
    end;
    CDS.Next;
  end;
  CDS.Filtered:=False;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if not CDS.IsEmpty and (cds.RecordCount >= iNo) then
  CDS.RecNo:=iNo;
end;

procedure TfrmProject.N5Click(Sender: TObject);
var iNo:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.RecordCount=0 then Exit;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('STATUS').AsInteger in [0,1,2,3,6,7,8,10])) then
    begin
      ShowMsg('当前状态不正确或是存在多选状态..',1);
      CDS.Filtered:=False;
      CDS.EnableControls;
      screen.Cursor:=crDefault;
      BitBtn2Click(nil);
      CDS.RecNo:=iNo;
      Exit;
    end;
    CDS.Next;
  end;
  CDS.First;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and ((CDS.FieldByName('STATUS').AsInteger=4) or (CDS.FieldByName('STATUS').AsInteger=5)) and (CDS.FieldByName('YS_EQ_STATUS').AsInteger<>1)) then
    begin
      dm.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Text:='update data0538 set STATUS=3,CAMZP_USER_PTR=null,CAMZP_DATE=null,CAM_USER_PTR=null,CAM_STAR_DATE=null where CUST_PART_PTR='''+CDS.fieldBYName('CUST_PART_PTR').AsString+''' and convert(varchar(10),curr_date,120)='''+FormatDateTime('yyyy-MM-dd',CDS.fieldBYName('curr_date').Value)+'''';
      dm.tmp.ExecSQL;
    end;
    CDS.Next;
  end;
  CDS.Filtered:=False;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if not CDS.IsEmpty and (cds.RecordCount >= iNo) then
  CDS.RecNo:=iNo;
end;

procedure TfrmProject.RadioGroup1Click(Sender: TObject);
begin
 case RadioGroup1.ItemIndex of
  0:
  begin
   CheckBox1.Checked:=True;
   CheckBox2.Checked:=False;
   CheckBox3.Checked:=False;
   CheckBox4.Checked:=False;
   CheckBox5.Checked:=False;
   CheckBox6.Checked:=False;
   CheckBox7.Checked:=False;
   CheckBox8.Checked:=False;
   CheckBox9.Checked:=False;
   CheckBox10.Checked:=False;
  end;
  1:
  begin
   CheckBox1.Checked:=False;
   CheckBox2.Checked:=False;
   CheckBox3.Checked:=False;
   CheckBox4.Checked:=True;
   CheckBox5.Checked:=False;
   CheckBox6.Checked:=False;
   CheckBox7.Checked:=False;
   CheckBox8.Checked:=False;
   CheckBox9.Checked:=False;
   CheckBox10.Checked:=False;
  end;
 end;
end;

procedure TfrmProject.btn1Click(Sender: TObject);
var
  LFrm1: Tfrmsumqry;
  LFrm2: Tfrmqrysumeh;
begin
  LFrm1 := Tfrmsumqry.Create(Self);
  try
    if LFrm1.ShowModal = mrok then
    begin
      lfrm2 := Tfrmqrysumeh.Create(Self);
      try
        LFrm2.cbbgptype.ItemIndex := LFrm1.rg1.ItemIndex;
        LFrm2.dtp1.DateTime := LFrm1.dtp1.DateTime;
        LFrm2.dtp2.DateTime := LFrm1.dtp2.DateTime;
        LFrm2.GetQryData;
        LFrm2.pgc1.ActivePageIndex := 0;
        LFrm2.ShowModal;
      finally
        LFrm2.Free;
      end;
    end;
  finally
    LFrm1.Free;
  end;
end;

procedure TfrmProject.CAM1Click(Sender: TObject);
var InputVar: PDlgInput ;
    iNo:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.RecordCount=0 then Exit;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('STATUS').AsInteger<>3)) then
    begin
      ShowMsg('当前状态不正确或是存在多选状态..',1);
      CDS.Filtered:=False;
      CDS.EnableControls;
      screen.Cursor:=crDefault;
      BitBtn2Click(nil);
      CDS.RecNo:=iNo;
      Exit;
    end;
    CDS.Next;
  end;
 try
    CDS.First;
    while not CDS.Eof do
    begin
      if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('STATUS').AsInteger=3)) then
      begin
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update data0538 set STATUS=6,IF_CamWf=1,CAMZP_USER_PTR='+Rkey05+',CAMZP_DATE='''+formatdatetime('yyyy-MM-dd hh:mm:ss',getsystem_date(dm.tmp,0))
        +''',CAM_USER_PTR='+rkey05+' where CUST_PART_PTR='''+CDS.fieldBYName('CUST_PART_PTR').AsString+''' and convert(varchar(10),curr_date,120)='''+FormatDateTime('yyyy-MM-dd',CDS.fieldBYName('curr_date').Value)+'''';
        dm.tmp.ExecSQL;//cam外发直接到aqe,是否外发处理改为是
      end;
      CDS.Next;
    end;
 finally

 end;
  CDS.Filtered:=False;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if not CDS.IsEmpty and (cds.RecordCount >= iNo) then
  CDS.RecNo:=iNo;
end;

end.
