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
    lbl1: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
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
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure ComboBox1Change(Sender: TObject);
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
  frmProject: TfrmProject;

implementation

uses PasDM, PasQuery,ConstVar,common, pasSetFieldName, pasMemo;

{$R *.dfm}
function TfrmProject.GetCheckBox():string;
var sTp:string;
    i:Integer;
begin
  sTp:='';
  for i:=1 to 11 do
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
      DM.Ado538.SQL.Text:=strSQLTxt+' where 1=1 '+Sqlstr+sWhereIN+' and DATA0538.curr_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
                           ''' and DATA0538.curr_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date)+''' order by DATA0538.curr_date desc';
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

procedure TfrmProject.FormShow(Sender: TObject);
var i:Integer;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  strSQLTxt:=dm.Ado538.SQL.Text;
  StartDate:=getsystem_date(DM.tmp,1)-100;
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
    DM.Ado538.SQL.Text:=strSQLTxt+' where 1=1 '+sWhereIN+' and DATA0538.curr_date>='''+formatdatetime('yyyy-mm-dd ',StartDate)+
                         ''' and DATA0538.curr_date<='''+formatdatetime('yyyy-mm-dd ',EndDate)+''' order by DATA0538.curr_date desc';
    DM.Ado538.Prepared;
    DM.Ado538.Open;
//    if not dm.Ado538.IsEmpty then
//    begin

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
          dm.CDS2.First;
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
end;

procedure TfrmProject.BitBtn2Click(Sender: TObject);
var strtemp:string;
begin
//  if DM.Ado538.IsEmpty then exit;

  strtemp := dm.Ado538MANU_PART_NUMBER.AsString;
  sWhereIN:=GetCheckBox();
  DM.Ado538.Close;
  DM.Ado538.SQL.Clear;
  DM.Ado538.SQL.Text:=strSQLTxt+' where 1=1 '+Sqlstr+sWhereIN+' and DATA0538.curr_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
                       ''' and DATA0538.curr_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date)+''' order by DATA0538.curr_date desc';
  DM.Ado538.Prepared;
  //showmessage(dm.Ado538.SQL.Text);
  DM.Ado538.Open;
  
  DM.Ado538.Locate('MANU_PART_NUMBER',strtemp,[]);
end;

procedure TfrmProject.FormCreate(Sender: TObject);
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
          DBGridEh1.Columns.Add.FieldName:=dbgrideh1.DataSource.DataSet.Fields.Fields[0].FieldName;
          DBGridEh1.Columns[0].Title.Caption:='选择';
          DBGridEh1.Columns[0].Width:=35;
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

procedure TfrmProject.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.Ado538.SQL.Text);
end;

procedure TfrmProject.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dbgrideh1.DataSource.DataSet.FieldByName('STATUS').Value = 7 then
     DBGridEh1.Canvas.Font.Color := clPurple
  else if dbgrideh1.DataSource.DataSet.FieldByName('STATUS').Value = 6 then
     DBGridEh1.Canvas.Font.Color := clGreen;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmProject.CheckBox1Click(Sender: TObject);
var strtemp:string;
begin
  sWhereIN:=GetCheckBox();
  DM.Ado538.Close;
  DM.Ado538.SQL.Clear;
  DM.Ado538.SQL.Text:=strSQLTxt+
    ' where 1=1 '+sWhereIN+
    ' and DATA0538.curr_date>='''
    +formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
    ''' and DATA0538.curr_date<='''
    +formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date)+
    ''' order by DATA0538.curr_date desc';
  DM.Ado538.Prepared;
  DM.Ado538.Open;

end;

procedure TfrmProject.CDSFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Assigned(Edit1) then
  if Trim(Edit1.Text) <>'' then
    Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(preColumn.FieldName).AsString),UpperCase(Edit1.Text) ) ;
end;

procedure TfrmProject.PopupMenu1Popup(Sender: TObject);
begin
    N1.Enabled := FALSE;
    N2.Enabled := FALSE;
    N3.Enabled := FALSE;
    IF DM.Ado538STATUS.AsInteger = 6 then N1.Enabled := true;

    IF DM.Ado538STATUS.AsInteger = 7 then N2.Enabled := true;

    IF DM.Ado538STATUS.AsInteger = 6 then N3.Enabled := true;
    IF DM.Ado538STATUS.AsInteger = 7 then N3.Enabled := true;
end;

procedure TfrmProject.N1Click(Sender: TObject);
begin
    if (strtoint(vprev) = 1) or (strtoint(vprev)= 3 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  dm.Ado538.Edit;
  dm.Ado538STATUS.Value := 7;
  dm.Ado538QAE_USER_PTR.Value := strtoint(user_ptr);
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text := 'select getdate() as t';
  dm.tmp.ExecSQL;
  dm.tmp.Open;
  dm.Ado538QAE_STAR_DATE.Value := dm.tmp.fieldbyname('t').AsDateTime;
  dm.tmp.Close;

  dm.Ado538.Post;
  dm.Ado538.UpdateBatch();
  BitBtn2.Click;
end;

procedure TfrmProject.N2Click(Sender: TObject);
begin
   if (strtoint(vprev) = 1) or (strtoint(vprev)= 3 ) then
   begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
   end;
   FrmMemo:=TFrmMemo.Create(Application);
   if FrmMemo.ShowModal=mrok then
   begin
    if StrToFloat(FrmMemo.Edit1.Text)=0 then
    begin
     ShowMessage('产品系数不能为0请重新输入!');
     Exit;
    end;
    dm.Ado538.Edit;
    dm.Ado538STATUS.Value := 8;
    dm.Ado538QAE_USER_PTR.Value := strtoint(user_ptr);
    
    if dm.Ado538IF_CamWf.Value=0 then
    dm.Ado538QAE_XiShu.Value:=StrToFloat(FrmMemo.Edit1.Text)
    else
    dm.Ado538QAE_XiShu.Value:=StrToFloat(FrmMemo.Edit1.Text)*0.6;

    dm.Ado538QAE_JCLX.Value:=FrmMemo.ComboBox1.Text;
    if FrmMemo.ComboBox2.Text='是' then
    begin
     dm.Ado538IF_HCL.value:=1;
    end;
    dm.tmp.SQL.Clear;
    dm.tmp.SQL.Text := 'select getdate() as t';
    dm.tmp.ExecSQL;
    dm.tmp.Open;
    dm.Ado538QAE_END_DATE.Value := dm.tmp.fieldbyname('t').AsDateTime;
    dm.tmp.Close;
    dm.Ado538.Post;
    dm.Ado538.UpdateBatch();
   end;
  BitBtn2.Click;
end;

procedure TfrmProject.N3Click(Sender: TObject);
begin
      if (strtoint(vprev) = 1) or (strtoint(vprev)= 3 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  if (dm.Ado538so_oldnew.Value='新单') or (dm.Ado538YSZP_USER_PTR.Value>0) then
  begin
  dm.Ado538.Edit;
  dm.Ado538STATUS.Value := 10;
  dm.Ado538QAE_USER_PTR.Value := strtoint(user_ptr);
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text := 'select getdate() as t';
  dm.tmp.ExecSQL;
  dm.tmp.Open;
  dm.Ado538QAE_SENDBACK.Value := dm.tmp.fieldbyname('t').AsDateTime;
  dm.tmp.Close;
  dm.Ado538.Post;
  dm.Ado538.UpdateBatch();
  end
  else
  begin
   if messagedlg('此订单为返单且没走预审流程,确定要退回重新预审吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
   dm.Ado538.Edit;
   dm.Ado538STATUS.Value :=0;
   dm.Ado538QAE_USER_PTR.Value := strtoint(user_ptr);
   dm.tmp.SQL.Clear;
   dm.tmp.SQL.Text := 'select getdate() as t';
   dm.tmp.ExecSQL;
   dm.tmp.Open;
   dm.Ado538QAE_SENDBACK.Value := dm.tmp.fieldbyname('t').AsDateTime;
   dm.tmp.Close;
   dm.Ado538.Post;
   dm.Ado538.UpdateBatch();
   end;
  end;
  BitBtn2.Click;
end;

procedure TfrmProject.Edit1Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
  lbl1.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
end;

procedure TfrmProject.DBGridEh1TitleClick(Column: TColumnEh);
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

procedure TfrmProject.ComboBox1Change(Sender: TObject);
var s,fieldname:string;
begin
if ComboBox1.ItemIndex=1 then
begin
s:='新单' ;
fieldname:='so_oldnew';
dm.Ado538.Filter :=fieldname+' = '''+ s +'''';
end
else if ComboBox1.ItemIndex=2 then
begin
s:='返单' ;
fieldname:='so_oldnew';
dm.Ado538.Filter :=fieldname+' = '''+ s +'''';
end
else
begin
 dm.Ado538.Filter :='';
end;
end;


end.
