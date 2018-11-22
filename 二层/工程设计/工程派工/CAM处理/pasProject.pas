unit pasProject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, ADODB,
  DBClient, Provider,StrUtils;

type
  TFrm_CamMain = class(TForm)
    Panel5: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    PopupMenu2: TPopupMenu;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    CAM2: TMenuItem;
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
    CheckBox11: TCheckBox;
    N4: TMenuItem;
    BitBtn6: TBitBtn;
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
    procedure CheckBox1Click(Sender: TObject);
    procedure CDSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
    Sqlstr:string;
    strSQLTxt:string;
    StartDate,EndDate:TDatetime;
    PreColumn: TColumnEh;
    field_name:string;
    Rk419:Integer;
    sWhereIN:string;
    function GetCheckBox():string;
  public
    { Public declarations }
  end;
var
  Frm_CamMain: TFrm_CamMain;

implementation

uses PasDM, PasQuery,ConstVar,common, pasSetFieldName, OrderSearch;

{$R *.dfm}
function TFrm_CamMain.GetCheckBox():string;
var sTp:string;
    i:Integer;
begin
  sTp:='';
  for i:=1 to 11 do
   if TCheckBox(FindComponent('checkBox'+inttostr(i))).Checked then
     sTp:=sTp+inttostr(TCheckBox(GroupBox1.Controls[i]).Tag)+',';
  Result:=' and DATA0538.STATUS in ('+sTp+'159)';
end;

procedure TFrm_CamMain.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_CamMain.BitBtn4Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption) ;
end;

procedure TFrm_CamMain.BitBtn1Click(Sender: TObject);
var i,j,iNo:integer;
    strText,sTemp:string;
begin
  if StartDate > 100 then
    FrmQuery.DateTimePicker3.Date:= StartDate
  else
    FrmQuery.DateTimePicker3.Date:=getsystem_date(DM.tmp,1)-1;
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
      DM.Ado538.SQL.Text:=strSQLTxt+' where data0538.CAM_user_ptr='+common.user_ptr+Sqlstr+sWhereIN+' and DATA0538.CAMzp_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
                           ''' and DATA0538.CAMzp_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date+1)+''' order by DATA0538.CAMzp_date desc';
      StartDate:=FrmQuery.DateTimePicker3.Date;
      EndDate:=FrmQuery.DateTimePicker5.Date;
      DM.Ado538.Prepared;
      DM.Ado538.Open; 
    finally
      DM.Ado538.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;

procedure TFrm_CamMain.FormShow(Sender: TObject);
var i:Integer;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  strSQLTxt:=dm.Ado538.SQL.Text;
  StartDate:=getsystem_date(DM.tmp,1)-1;
  EndDate:=getsystem_date(DM.tmp,1);
  sWhereIN:=GetCheckBox();
  FrmQuery.DateTimePicker3.Date:=StartDate;
  FrmQuery.DateTimePicker5.Date:=EndDate;
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
    DM.Ado538.SQL.Text:=strSQLTxt+' where CAM_USER_PTR='+common.user_ptr+sWhereIN+' and DATA0538.CAMzp_date>='''+formatdatetime('yyyy-mm-dd ',StartDate)+
                         ''' and DATA0538.CAMzp_date<='''+formatdatetime('yyyy-mm-dd ',EndDate+1)+''' order by DATA0538.CAMzp_date desc';
    DM.Ado538.Prepared;
    DM.Ado538.Open;
     try
        DM.Ado0849.Close;
        DM.Ado0849.Parameters.ParamByName('D419_ptr').Value:=Rk419;
        DM.Ado0849.Parameters.ParamByName('D073_ptr').Value:=rkey73;
        DM.Ado0849.Prepared;
        DM.Ado0849.Open;
        if (not DM.Ado0849.IsEmpty) then
        begin   //有849，加载
          DM.CDS2.Data:=DM.DSP2.Data;
          for i:=DBGridEh1.Columns.Count downto 1 do
          begin
            DBGridEh1.Columns.Delete(i-1);
          end;
          dm.CDS2.IndexFieldNames:='FieldOrder';
          DM.CDS2.Filtered:=True;
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
            end else
            dm.CDS2.Next;
          end;
          DM.CDS2.Filtered:=False;
        end
        else //没有849，保存
        begin
          dm.Ado849s.Close;
          dm.Ado849s.Open;
          for i:=0 to DBGridEh1.FieldCount-1 do
          begin
            DM.Ado849s.Append;
            DM.Ado849s.FieldByName('D419_ptr').Value:=Rk419;
            DM.Ado849s.FieldByName('D073_ptr').Value:=StrToInt(rkey73);
            DM.Ado849s.FieldByName('FormName').Value:='Frm_CamMain';
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
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[1] ;
  PreColumn.Title.Color := clred ;
end;

procedure TFrm_CamMain.BitBtn2Click(Sender: TObject);
var strtemp:string;
begin
  strtemp := dm.Ado538MANU_PART_NUMBER.AsString;
  sWhereIN:=GetCheckBox();
  DM.Ado538.Close;
  DM.Ado538.SQL.Clear;
  DM.Ado538.SQL.Text:=strSQLTxt+' where data0538.CAM_user_ptr='+common.user_ptr+Sqlstr+sWhereIN+' and DATA0538.CAMzp_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
                       ''' and DATA0538.CAMzp_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date+1)+''' order by DATA0538.CAMzp_date desc';
  DM.Ado538.Prepared;
  DM.Ado538.Open;

  DM.Ado538.Locate('MANU_PART_NUMBER',strtemp,[]);
end;

procedure TFrm_CamMain.FormCreate(Sender: TObject);
begin
  if not app_init_2(DM.ADOConnection1) then
  begin
   showmsg('程序起动失败请联系管理员!',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

//  rkey73:='2141';
//  user_ptr:='2217';
//  vprev:='4';
end;

procedure TFrm_CamMain.BitBtn3Click(Sender: TObject);
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
        DM.Ado538.EnableControls;
      end;
    end;
  finally
    frmSetFieldName.Free;
  end;
end;

procedure TFrm_CamMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.Ado538.SQL.Text);
end;

procedure TFrm_CamMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dbgrideh1.DataSource.DataSet.FieldByName('STATUS').Value = 7 then
     DBGridEh1.Canvas.Font.Color := clPurple
  else if dbgrideh1.DataSource.DataSet.FieldByName('STATUS').Value = 6 then
     DBGridEh1.Canvas.Font.Color := clGreen;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_CamMain.CheckBox1Click(Sender: TObject);
var strtemp:string;
begin
  sWhereIN:=GetCheckBox();
  DM.Ado538.Close;
  DM.Ado538.SQL.Clear;
  DM.Ado538.SQL.Text:=strSQLTxt+
    ' where CAM_user_ptr='+common.user_ptr+sWhereIN+
    ' and DATA0538.CAMzp_date>='''
    +formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
    ''' and DATA0538.CAMzp_date<='''
    +formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date)+
    ''' order by DATA0538.CAMzp_date desc';
  DM.Ado538.Prepared;
  DM.Ado538.Open;

end;

procedure TFrm_CamMain.CDSFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Assigned(Edit1) then
  if Trim(Edit1.Text) <>'' then
    Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(preColumn.FieldName).AsString),UpperCase(Edit1.Text) ) ;
end;

procedure TFrm_CamMain.PopupMenu1Popup(Sender: TObject);
begin
 if dm.Ado538.IsEmpty then
 begin
  N1.Enabled:=False;
  N2.Enabled:=False;
  N3.Enabled:=False;
  N4.Enabled:=False;
 end
 else
 begin
  N1.Enabled:=((dm.Ado538STATUS.Value=4) or (dm.Ado538STATUS.Value=10)) and (DM.Ado538CAM_EQ_STATUS.Value<>1);
  N2.Enabled:=(dm.Ado538STATUS.Value=5) and (DM.Ado538CAM_EQ_STATUS.Value<>1);
  N3.Enabled:=(dm.Ado538CAM_EQ_STATUS.Value<>1) and ((dm.Ado538STATUS.Value=4) or (dm.Ado538STATUS.Value=5));
  N4.Enabled:=dm.Ado538CAM_EQ_STATUS.Value=1;
 end;
end;

procedure TFrm_CamMain.N1Click(Sender: TObject);
begin
    if (strtoint(vprev) = 1) or (strtoint(vprev)= 3 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  dm.Ado538.Edit;
  dm.Ado538STATUS.Value :=5;
  dm.Ado538YS_USER_PTR.Value := strtoint(user_ptr);
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text := 'select getdate() as t';
  dm.tmp.ExecSQL;
  dm.tmp.Open;
  dm.Ado538CAM_STAR_DATE.Value := dm.tmp.fieldbyname('t').AsDateTime;
  dm.tmp.Close;

  dm.Ado538.Post;
  dm.Ado538.UpdateBatch();
  BitBtn2.Click;
end;

procedure TFrm_CamMain.N2Click(Sender: TObject);
begin
      if (strtoint(vprev) = 1) or (strtoint(vprev)= 3 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  dm.Ado538.Edit;
  dm.Ado538STATUS.Value :=6;
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text := 'select getdate() as t';
  dm.tmp.ExecSQL;
  dm.tmp.Open;
  dm.Ado538CAM_EDN_DATE.Value := dm.tmp.fieldbyname('t').AsDateTime;
  dm.tmp.Close;

  dm.Ado538.Post;
  dm.Ado538.UpdateBatch();
  BitBtn2.Click;
end;

procedure TFrm_CamMain.N3Click(Sender: TObject);
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev)= 3 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  dm.Ado538.Edit;
  DM.Ado538CAM_EQ_STATUS.Value:=1;
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text := 'select getdate() as t';
  dm.tmp.ExecSQL;
  dm.tmp.Open;
  dm.Ado538CAM_EQ_STAR.Value := dm.tmp.fieldbyname('t').AsDateTime;
  dm.tmp.Close;

  dm.Ado538.Post;
  dm.Ado538.UpdateBatch();
  BitBtn2.Click;
end;

procedure TFrm_CamMain.N4Click(Sender: TObject);
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev)= 3 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  dm.Ado538.Edit;
  DM.Ado538CAM_EQ_STATUS.Value:=2;
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text := 'select getdate() as t';
  dm.tmp.ExecSQL;
  dm.tmp.Open;
  dm.Ado538CAM_EQ_END.Value := dm.tmp.fieldbyname('t').AsDateTime;
  dm.tmp.Close;

  dm.Ado538.Post;
  dm.Ado538.UpdateBatch();
  BitBtn2.Click;
end;

procedure TFrm_CamMain.BitBtn6Click(Sender: TObject);
begin
 if (strtoint(vprev) = 1) or (strtoint(vprev)= 3 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  Frm_OderSearch:=TFrm_OderSearch.Create(Application);
  with Frm_OderSearch.ADOQuery1 do
  begin
    Close;
    Parameters[0].Value:=common.getsystem_date(dm.tmp,1)-7;
    Parameters[0].Value:=common.getsystem_date(dm.tmp,1);
    Open;
  end;
  if Frm_OderSearch.ShowModal=mrok then
  begin
   with dm.tmp do
   begin
    Close;
    SQL.Clear;
    SQL.Add('update data0538 set status=4,cam_user_ptr='+common.user_ptr);
    sql.Add(',camzp_user_ptr='+common.user_ptr+',camzp_date=getdate()');
    SQL.Add('where data0538.CUST_PART_PTR='+Frm_OderSearch.ADOQuery1CUST_PART_PTR.AsString);
    sql.Add('and data0538.curr_date='+quotedstr(Frm_OderSearch.ADOQuery1curr_date.AsString));
    ExecSQL;
   end;
   ShowMessage('成功获得工程订单!');
   BitBtn2Click(Sender);
  end;  
end;

procedure TFrm_CamMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.Ado538.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.Ado538.Sort:= Column.FieldName + ' DESC';
  end;

  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
  begin
    label1.Caption:=column.Title.Caption + ':';
    self.field_name:=column.FieldName;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
    edit1.SetFocus;
end;

procedure TFrm_CamMain.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 dm.Ado538.Filter := field_name+' like ''%'+Trim(Edit1.Text)+'%'''
else
 dm.Ado538.Filter := '';
end;

procedure TFrm_CamMain.N6Click(Sender: TObject);
begin
if (strtoint(vprev) = 1) or (strtoint(vprev)= 3 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  dm.Ado538.Edit;
  DM.Ado538STATUS.Value:=9;
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text := 'select getdate() as t';
  dm.tmp.ExecSQL;
  dm.tmp.Open;
  dm.Ado538CAM_SENDBACK.Value := dm.tmp.fieldbyname('t').AsDateTime;
  dm.tmp.Close;

  dm.Ado538.Post;
  dm.Ado538.UpdateBatch();
  BitBtn2.Click;
end;

end.
