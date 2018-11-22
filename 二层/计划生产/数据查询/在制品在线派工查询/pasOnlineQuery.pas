unit pasOnlineQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls,DateUtils;

type
  TShowField=class
    WORK_ORDER_NUMBER:string;// 作业单
    DEPT_PTR:Integer;//34RKey
    DEPT_CODE:string;//工序编号
    DEPT_NAME:string;//工序名称
    STEP:Integer;//步骤
    YNTimeout:string;//是否超时
    Timeouts:Double;//超时时间
  end;
type
  TFrmOnlineQuery = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Memo1: TMemo;
    DBGridEh1: TDBGridEh;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Button1: TButton;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Button4: TButton;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    iNum1,iNum2:Integer; //是否派工个数，超期个数
    StartDate,EndDate:TDatetime;
    PreColumn: TColumnEh;
    field_name:string;
    Rkey05:string;
    Rk419:Integer;
    procedure item_click(sender: TObject);
    //取表RKey值
    function GetDataRkey2(Const Tablename:String;AdoConn:TADOConnection;whereT:String=''):Integer;
  public
    Sqlstr:string;
    SQLTxt:string;
    { Public declarations }
  end;

var
  FrmOnlineQuery: TFrmOnlineQuery;
  ListShow: TList; //存列表

implementation
uses common,PasPublic, PasQuery, PasDispatchSMS, PasStepPause,
  PasBatchPause, PasAllPause, PasCollect, pasSetFieldName, PasDM;

{$R *.dfm}

//取表RKey值
function TFrmOnlineQuery.GetDataRkey2(Const Tablename:String;AdoConn:TADOConnection;whereT:String=''):Integer;
var tmpAdo:TADOQuery;
begin
  try
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=AdoConn;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      if (whereT<>'') then
        tmpAdo.SQL.Text:='select * from '+Tablename+' '+whereT+''
      else
        tmpAdo.SQL.Text:='select * from '+Tablename+'';
      tmpAdo.Open;
      if not tmpAdo.Eof then
      begin
        Result:=tmpAdo.FieldBYName('Rkey').AsInteger;
      end else
        Result:=0;
    except
      Result:=0;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
    tmpAdo:=nil;
  end;
end;


procedure TFrmOnlineQuery.item_click(Sender: TObject);
var
  i:byte;
begin
  (Sender as TmenuItem).Checked := not ((Sender as TmenuItem).Checked);
  if (Sender as TmenuItem).Checked then
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := True ;
      Break;
    end ;
  end
  else
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := False ;
      Break;
    end ;
  end ;
end;

procedure TFrmOnlineQuery.BitBtn4Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgrideh1,self.Caption);
end;

procedure TFrmOnlineQuery.BitBtn5Click(Sender: TObject);
var i:Integer;
begin
  frmSetFieldName:=TfrmSetFieldName.Create(Application);
  try
    frmSetFieldName.rkey419:= Rk419;
    if frmSetFieldName.ShowModal=mrok then
    begin
      try
        DM.ADOQuery4.DisableControls;
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
//          DBGridEh1.Columns.Add.FieldName:=CDS.Fields.Fields[0].FieldName;
//          DBGridEh1.Columns[0].Title.Caption:='选择';
//          DBGridEh1.Columns[0].Width:=35;
          i:=0;
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
        DM.ADOQuery4.EnableControls;
      end;
    end;
  finally
    frmSetFieldName.Free;
  end;
//  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrmOnlineQuery.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmOnlineQuery.BitBtn2Click(Sender: TObject);
var i,j:integer;
    strText,sTemp:string;
    tmpAdo:TADOQuery;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  if StartDate > 100 then
    FrmQuery.DTPk1.Date:= StartDate
  else
    FrmQuery.DTPk1.Date:=StartOfTheMonth(IncMonth(now,-1));
  if EndDate > 100 then
    FrmQuery.DTPk2.Date:= EndDate
  else
    FrmQuery.DTPk2.Date:=EndOfTheMonth(Now);
  //-- 判断是否设置派工周期----------
  i:=ResultRecordCount('dbo.data0051',DM.ADOConnection1,'');
  if (i=0) then
  begin
    ShowMsg('没有进行工序周期设置，请先设置好基本数据！',1);
    Exit;
  end;
  i:=ResultRecordCount('dbo.data0054',DM.ADOConnection1,'');
  if (i=0) then
  begin
    ShowMsg('没有进行周期设置，请先设置好基本数据！',1);
    Exit;
  end;
  sTemp:='';
  //--end 判断是否设置派工周期-------
  if FrmQuery.ShowModal=mrok then
  begin
    try
      DBGridEh1.Cursor:=crHourGlass;
      DM.ADOQuery4.DisableControls;
      DM.ADOQuery4.Close;
      Sqlstr:='';
      for i:=1 to FrmQuery.SGrid1.RowCount-2 do
      if FrmQuery.sgrid1.Cells[2,i]<> ''
      then
      Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
        DM.ADOQuery4.SQL.Text:=SQLTxt+' '+Sqlstr+' order by data0056.IF_PAIGONG desc,派工要求完成时间,派工剩余小时';
      StartDate:=FrmQuery.DTPk1.Date;
      EndDate:=FrmQuery.DTPk2.Date;
      DM.ADOQuery4.Prepared;
      DM.ADOQuery4.Open;
      DM.ADOQuery4.RecordCount;
      if (not DM.ADOQuery4.IsEmpty) then
      begin
        iNum1:=0;
        iNum2:=0;
        ListDEPT:=TStringList.Create;
        ListDEPT.Clear;
        DM.ADOQuery4.First;

        for i :=0  to DM.ADOQuery4.RecordCount-1 do
        begin
          if (DM.ADOQuery4.FieldByName('是否派工').AsString='是') then
          begin
            iNum1:=iNum1+1;
            if (DM.ADOQuery4.FieldByName('派工是否超时').AsString='Y') then iNum2:=iNum2+1;
            ListDEPT.Add(DBGridEh1.DataSource.DataSet.FieldValues['DEPT_PTR']);
            DM.ADOQuery4.Next;
          end;
        end;
        try
          ListDEPT.Sort;
          ListDEPT2:=TStringList.Create;
          ListDEPT2.Sorted:=True;
          ListDEPT2.Duplicates:=dupIgnore;
          ListDEPT.BeginUpdate;
          for i :=0  to ListDEPT.Count-1 do
          begin
            ListDEPT2.Add(ListDEPT[i]);
          end;
          ListDEPT2.EndUpdate;
          ListDEPT.Assign(ListDEPT2);
        finally
          ListDEPT2.Free;
        end;
        DM.ADOQuery4.First;
      end;
      Label3.Caption:=IntToStr(iNum2)+' / ';
      Label5.Caption:=IntToStr(iNum1)+' = ';
      if (iNum1<>0) then Label7.Caption:=FormatFloat('0.00',(iNum2/iNum1)*100)+'%' else Label7.Caption:='0';
    finally
      DM.ADOQuery4.EnableControls;
    end;
    DBGridEh1.Cursor:=crDefault;
    Timer1Timer(Sender);
  end;
end;

procedure TFrmOnlineQuery.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName)  and
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

procedure TFrmOnlineQuery.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.ADOQuery4.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
  else
    DM.ADOQuery4.Filter:='';
end;

procedure TFrmOnlineQuery.FormShow(Sender: TObject);
var i:integer;
    item:TMenuItem;
begin
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Text:='select EMPLOYEE_PTR from data0073 where Rkey='+Rkey73;
    Open;
    if not IsEmpty then
      Rkey05:=FieldByName('EMPLOYEE_PTR').AsString
    else
      Rkey05:='-1';//2570;
  end;
  Sqlstr:='';
  SQLTxt:=DM.ADOQuery4.SQL.Text;
  StartDate:=Date;EndDate:=Date;

  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Text:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
    Open;
    if not IsEmpty then
      Rk419:=FieldByName('rkey').AsInteger
    else
      Rk419:=-1;//2570;
  end;
  Sqlstr:='and WORK_ORDER_NUMBER=''nnnn''';
  DM.ADOQuery4.Close;
  DM.ADOQuery4.SQL.Text:=SQLTxt+' '+Sqlstr+' order by data0056.IF_PAIGONG desc,派工要求完成时间,派工剩余小时';
  DM.ADOQuery4.Prepared;
  DM.ADOQuery4.Open;
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
//      DBGridEh1.Columns.Add.FieldName:=CDS.Fields.Fields[0].FieldName;
//      DBGridEh1.Columns[0].Title.Caption:='选择';
//      DBGridEh1.Columns[0].Width:=35;
      i:=0;
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
      for i:=0 to DBGridEh1.FieldCount-1 do
      begin
        DM.Ado849s.Append;
        DM.Ado849s.FieldByName('D419_ptr').Value:=Rk419;
        DM.Ado849s.FieldByName('D073_ptr').Value:=StrToInt(rkey73);
        DM.Ado849s.FieldByName('FormName').Value:='FrmOnlineQuery';
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

  end;

  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
//  Label1.Caption:=preColumn.Title.Caption;
//  for i:=0 to DBGridEh1.FieldCount-1 do
//  begin
//   item:=TmenuItem.Create(self);
//   item.Caption:=DBGridEh1.Columns[i].Title.Caption;
//   if DBGridEh1.Columns[i].Visible then
//    item.Checked:=true;
//   item.OnClick:=item_click;
//   self.PopupMenu1.Items.Add(item);
//  end;
  FrmQuery.iItem:=0;
end;

procedure TFrmOnlineQuery.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    showmessage(DM.ADOQuery4.SQL.Text);
end;

procedure TFrmOnlineQuery.N1Click(Sender: TObject);
//var i:byte;
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.ADOQuery4.IsEmpty) then Exit;
  if (DBGridEh1.DataSource.DataSet.FieldByName('是否派工').AsString='') then Exit;
  with TfrmStepPause.Create(nil) do
  begin
    if showmodal=mrok then
    begin
      DBGridEh1.Cursor:=crHourGlass;
      DM.ADOQuery4.Close;
      DM.ADOQuery4.SQL.Text:=SQLTxt+' '+Sqlstr+' order by data0056.IF_PAIGONG desc,派工要求完成时间,派工剩余小时';
      DM.ADOQuery4.Prepared;
      DM.ADOQuery4.Open;
    end;
    DBGridEh1.Cursor:=crDefault;
    Free;
  end;
end;

procedure TFrmOnlineQuery.Timer1Timer(Sender: TObject);
var tmpAdo:TADOQuery;
    strText:string;
    sShowField:TShowField;
    i,j,iD34Rkey,rkey14,iNo:Integer;
    send_msg:tstringlist;
begin

  if DM.ADOQuery4.ControlsDisabled = true then
  begin
    showmessage('数据集无法操作');
    exit;
  end;

  if (not DM.ADOQuery4.IsEmpty) then
  begin
    try
      DM.ADOQuery4.DisableControls;
      Timer1.Interval:=600000;//十分钟
      DM.ADOQuery4.Close;
      DM.ADOQuery4.SQL.Text:=SQLTxt+' '+Sqlstr+' order by data0056.IF_PAIGONG desc,派工要求完成时间,派工剩余小时';
      DM.ADOQuery4.Prepared;
      DM.ADOQuery4.Open;
      application.ProcessMessages; 
      try
        try

        tmpAdo:=TADOQuery.Create(Application);
        tmpAdo.Connection:=DM.ADOConnection1;

        if (DM.ADOQuery4.RecordCount>0) then
        begin
          //----统计工序-------------------------------------
          ListDEPT.Clear;
          DM.ADOQuery4.First;
          for i :=0  to DM.ADOQuery4.RecordCount-1 do
          begin
            if (DM.ADOQuery4.FieldByName('是否派工').AsString='是') then
            begin
              ListDEPT.Add(DBGridEh1.DataSource.DataSet.FieldValues['DEPT_PTR']);
              DM.ADOQuery4.Next;
            end;
          end;
           application.ProcessMessages;
          try
            ListDEPT.Sort;
            ListDEPT2:=TStringList.Create;
            ListDEPT2.Sorted:=True;
            ListDEPT2.Duplicates:=dupIgnore;
            ListDEPT.BeginUpdate;
            for i :=0  to ListDEPT.Count-1 do
            begin
              ListDEPT2.Add(ListDEPT[i]);
            end;
            ListDEPT2.EndUpdate;
            ListDEPT.Assign(ListDEPT2);
          finally
            ListDEPT2.Free;
          end;
          application.ProcessMessages;
          //-----end 统计工序-------------------------------
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Text:='select distinct d34_Ptr from dbo.data0059'; //取短信接收人所有工序类型
          tmpAdo.Open;
          if (not tmpAdo.IsEmpty) then
          begin
            tmpAdo.First;
            while not tmpAdo.Eof do
            begin
              DM.ADOQuery4.First;
              ListShow:=TList.Create;
              send_msg:=tstringlist.Create;
              send_msg.Text:='';
              while ((DBGridEh1.DataSource.DataSet.FieldByName('派工剩余小时').AsFloat<=1) and (DBGridEh1.DataSource.DataSet.FieldByName('派工剩余小时').AsFloat>=0)) do
              begin
                if (tmpAdo.FieldByName('d34_Ptr').AsInteger=DM.ADOQuery4.FieldByName('DEPT_PTR').AsInteger) then //当前工序与接收短信相同，判断56当前工序是否已发送
                begin
                  DM.ADOQuery1.Close;
                  DM.ADOQuery1.SQL.Clear;
                  DM.ADOQuery1.SQL.Add('select * from dbo.data0056 where WO_PTR=:WO_PTR and DEPT_PTR=:DEPT_PTR and STEP=:STEP and IF_MESSAGE=0');
                  DM.ADOQuery1.Parameters.ParamByName('WO_PTR').Value:=GetDataRkey2('Data0006',DM.ADOConnection1,' where WORK_ORDER_NUMBER='''+DM.ADOQuery4.FieldByName('WORK_ORDER_NUMBER').AsString+'''');
                  DM.ADOQuery1.Parameters.ParamByName('DEPT_PTR').Value:=tmpAdo.FieldByName('d34_Ptr').AsInteger;
                  DM.ADOQuery1.Parameters.ParamByName('STEP').Value:=DM.ADOQuery4.FieldByName('STEP').Value;
                  DM.ADOQuery1.Open;
                  if not DM.ADOQuery1.IsEmpty then
                  begin
                    send_msg.Add('作业单号【'+DM.ADOQuery4.FieldByName('WORK_ORDER_NUMBER').AsString+'】在【'+DM.ADOQuery4.FieldByName('DEPT_NAME').AsString+'】工序已超时周期为【'+DBGridEh1.DataSource.DataSet.FieldByName('派工剩余小时').AsString+'】');
                    sShowField:=TShowField.Create;
                    sShowField.WORK_ORDER_NUMBER:=DM.ADOQuery4.FieldByName('WORK_ORDER_NUMBER').AsString;
                    sShowField.DEPT_PTR:=DM.ADOQuery4.FieldByName('DEPT_PTR').AsInteger;
                    sShowField.DEPT_CODE:=DM.ADOQuery4.FieldByName('DEPT_CODE').AsString;
                    sShowField.DEPT_NAME:=DM.ADOQuery4.FieldByName('DEPT_NAME').AsString;
                    sShowField.STEP:=DM.ADOQuery4.FieldByName('STEP').Value;
                    sShowField.YNTimeout:=DBGridEh1.DataSource.DataSet.FieldByName('派工是否超时').AsString;
                    sShowField.Timeouts:=DBGridEh1.DataSource.DataSet.FieldByName('派工剩余小时').AsFloat;
                    ListShow.Add(sShowField);
                  end;
                end;
                DBGridEh1.DataSource.DataSet.Next;
              end;
                  application.ProcessMessages;
              if (send_msg.Text<>'') then
              begin
                send_msg.Insert(0,'作业单已准备超过要求完工时间,请及时处理,日期:'
                +datetimetostr(common.getsystem_date(DM.ADOQuery2,0)));
                with DM.ADOQuery2 do
                begin
                  close;
                  sql.Clear;
                  sql.Add('select * from data0014 where rkey is null');
                  open;
                  append;
                  fieldvalues['MESSAGE'] := send_msg.Text;
                  fieldvalues['whosend']:= strtoint(rkey73);
                  post;
                  rkey14:=fieldvalues['rkey'];
                end;
                DM.ADOQuery2.Close;
                DM.ADOQuery2.SQL.Clear;
                DM.ADOQuery2.SQL.Text:='select * from dbo.data0059 where d34_Ptr='+tmpAdo.FieldByName('d34_Ptr').AsString;
                DM.ADOQuery2.Open;
                if (not DM.ADOQuery2.IsEmpty) then
                begin
                  DM.ADOQuery2.First;
                  while not DM.ADOQuery2.Eof do
                  begin
                    DM.ADOQuery1.close;
                    DM.ADOQuery1.SQL.Clear;
                    DM.ADOQuery1.sql.Text:='insert into data0314 (emp_ptr,d14_ptr) Values(:emp_ptr,:d14_ptr)';
                    DM.ADOQuery1.Parameters.ParamByName('emp_ptr').Value:=GetDataRkey2('dbo.data0073',DM.ADOConnection1,' where USER_LOGIN_NAME='''+DM.ADOQuery2.FieldByName('USER_LOGIN_NAME').AsString+'''');
                    DM.ADOQuery1.Parameters.ParamByName('d14_ptr').Value:=rkey14;
                    DM.ADOQuery1.ExecSQL;
                    DM.ADOQuery2.Next;
                  end;
                end;
                  application.ProcessMessages;
                for  j:=0 to ListShow.Count-1 do
                begin
                  sShowField:=ListShow.Items[j];
                  if sShowField<>nil then
                  begin
                    DM.ADOQuery1.Close;
                    DM.ADOQuery1.SQL.Clear;
                    DM.ADOQuery1.SQL.Add('update Data0056 set IF_MESSAGE=1 where WO_PTR=:WO_PTR and DEPT_PTR=:DEPT_PTR and STEP=:STEP');
                    DM.ADOQuery1.Parameters.ParamByName('WO_PTR').Value:=GetDataRkey2('Data0006',DM.ADOConnection1,' where WORK_ORDER_NUMBER='''+sShowField.WORK_ORDER_NUMBER+'''');
                    DM.ADOQuery1.Parameters.ParamByName('DEPT_PTR').Value:=sShowField.DEPT_PTR;
                    DM.ADOQuery1.Parameters.ParamByName('STEP').Value:=sShowField.STEP;
                    DM.ADOQuery1.ExecSQL;
                  end;
                end;
                sShowField.Free;
              end;
              send_msg.Free;
              tmpAdo.Next;
            end;
          end;
           application.ProcessMessages;
        end;
        except
         ShowMsg('发送派工超时提示信息错误，请联系管理员！',1);
        Exit;
        end;
      finally
        tmpAdo.Close;
        tmpAdo.Connection:=nil;
        tmpAdo.Free;
        tmpAdo:=nil;
      end;
    finally
      DM.ADOQuery4.EnableControls;
    end;
  end;
end;

procedure TFrmOnlineQuery.BitBtn3Click(Sender: TObject);
begin
  DM.ADOQuery4.Close;
  DM.ADOQuery4.SQL.Text:=SQLTxt+' '+Sqlstr+' order by data0056.IF_PAIGONG desc,派工要求完成时间,派工剩余小时';
  DM.ADOQuery4.Prepared;
  DM.ADOQuery4.Open;
end;

procedure TFrmOnlineQuery.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName('派工剩余小时').AsString<>'' then
  begin
    if ((DBGridEh1.DataSource.DataSet.FieldByName('派工剩余小时').AsFloat<=1) and (DBGridEh1.DataSource.DataSet.FieldByName('派工剩余小时').AsFloat>=0)) then
      DBGridEh1.Canvas.Font.Color := clFuchsia;
    if (DBGridEh1.DataSource.DataSet.FieldByName('派工剩余小时').AsFloat<0) then
      DBGridEh1.Canvas.Font.Color := clRed;
  end;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmOnlineQuery.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM.ADOConnection1) then
  begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;

//  rkey73:='2525';
//  user_ptr:='2217';
//  vprev:='4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TFrmOnlineQuery.FormActivate(Sender: TObject);
//var i:integer;
//    item:TMenuItem;
begin
//  Sqlstr:='and WORK_ORDER_NUMBER=''nnnn''';
//  DM.ADOQuery4.Close;
//  DM.ADOQuery4.SQL.Text:=SQLTxt+' '+Sqlstr+' order by data0056.IF_PAIGONG desc,派工要求完成时间,派工剩余小时';
//  DM.ADOQuery4.Prepared;
//  DM.ADOQuery4.Open;
//  for i:=0 to DBGridEh1.FieldCount-1 do
//  begin
//   item:=TmenuItem.Create(self);
//   item.Caption:=DBGridEh1.Columns[i].Title.Caption;
//   if DBGridEh1.Columns[i].Visible then
//    item.Checked:=true;
//   item.OnClick:=item_click;
//   self.PopupMenu1.Items.Add(item);
//  end;
end;

procedure TFrmOnlineQuery.Button1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  FrmDispatchSMS:=TFrmDispatchSMS.Create(application);
  FrmDispatchSMS.ShowModal;
  FrmDispatchSMS.Free;
end;

procedure TFrmOnlineQuery.Button2Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.ADOQuery4.IsEmpty) then Exit;
  with TFrmBatchPause.Create(Application) do
  begin
    if showmodal=mrok then
    begin
      DBGridEh1.Cursor:=crHourGlass;
      DM.ADOQuery4.Close;
      DM.ADOQuery4.SQL.Text:=SQLTxt+' '+Sqlstr+' order by data0056.IF_PAIGONG desc,派工要求完成时间,派工剩余小时';
      DM.ADOQuery4.Prepared;
      DM.ADOQuery4.Open;
    end;
    DBGridEh1.Cursor:=crDefault;
    Free;
  end;
end;

procedure TFrmOnlineQuery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ListDEPT.free;
end;

procedure TFrmOnlineQuery.Button3Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.ADOQuery4.IsEmpty) then Exit;
  FrmAllPause:=TFrmAllPause.Create(application);
  FrmAllPause.ShowModal;
  FrmAllPause.Free;
end;

procedure TFrmOnlineQuery.Button4Click(Sender: TObject);
var j,i,iTemp:Integer;
    iSumRecord,iSumRecord2:Integer;
begin
  if DM.ADOQuery4.IsEmpty then Exit;
  DM.ADOQuery4.DisableControls;
  with TFrmCollect.Create(Application) do
  begin
    SG1.Cells[0,0]:='工序类型';
    SG1.Cells[1,0]:='工序名称';
    SG1.Cells[2,0]:='派工总数';
    SG1.Cells[3,0]:='准期个数';
    SG1.Cells[4,0]:='超期个数';
    SG1.Cells[5,0]:='超期百分比';
    SG1.Cells[6,0]:='准期百分比';
    if (DM.ADOQuery4.RecordCount>0) then
    begin
      for  j:=0 to ListDEPT.Count-1 do
      begin
        iSumRecord:=0;
        iSumRecord2:=0;
        DM.ADOQuery1.Close;
        DM.ADOQuery1.SQL.Clear;
        DM.ADOQuery1.SQL.Text:='select DEPT_CODE,DEPT_NAME from dbo.data0034 where TTYPE=1 and Rkey='+ListDEPT[j];
        DM.ADOQuery1.Open;
        SG1.Cells[0,j+1]:=DM.ADOQuery1.FieldBYName('DEPT_CODE').AsString;
        SG1.Cells[1,j+1]:=DM.ADOQuery1.FieldBYName('DEPT_NAME').AsString;
        SG1.RowCount:=SG1.RowCount+1;
        DM.ADOQuery4.First;
        while not DM.ADOQuery4.Eof do
        begin
          if (DM.ADOQuery4.FieldByName('是否派工').AsString='是') then
          begin
            if (DM.ADOQuery4.FieldByName('DEPT_PTR').AsInteger=StrToInt(ListDEPT[j])) then
            begin
              iSumRecord:=iSumRecord+1;
              if (DM.ADOQuery4.FieldByName('派工是否超时').AsString='Y') then iSumRecord2:=iSumRecord2+1;
            end;
          end else Break;
          DM.ADOQuery4.Next;
        end;
//        ShowMessage(IntToStr(iSumRecord));
//        ShowMessage(IntToStr(iSumRecord2));
        SG1.Cells[2,j+1]:=IntToStr(iSumRecord);
        SG1.Cells[3,j+1]:=IntToStr(iSumRecord-iSumRecord2);
        SG1.Cells[4,j+1]:=IntToStr(iSumRecord2);
        SG1.Cells[5,j+1]:=FormatFloat('0.00',((iSumRecord2/iSumRecord)*100));
        SG1.Cells[6,j+1]:=FormatFloat('0.00',(((iSumRecord-iSumRecord2)/iSumRecord)*100));
      end;
    end;

    if showmodal=mrok then
    begin

    end;
    Free;
  end;
  DM.ADOQuery4.First;
  DM.ADOQuery4.EnableControls;
end;

end.
