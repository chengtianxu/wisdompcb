unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, daDataModule, ComCtrls, DBGrids,DateUtils;

type
  TMain_Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    BtQry: TBitBtn;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn7: TBitBtn;
    N4: TMenuItem;
    N5: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    PopupMenu3: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    DBGridEh2: TDBGridEh;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    N10: TMenuItem;
    N11: TMenuItem;
    DBGridEh3: TDBGridEh;
    DBGridEh4: TDBGridEh;
    N31: TMenuItem;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    Image1: TImage;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    Panel3: TPanel;
    pnl1_1: TPanel;
    pnl2_2: TPanel;
    pnl3_3: TPanel;
    CheckBox2: TCheckBox;
    btn1: TBitBtn;
    BitBtn8: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N31Click(Sender: TObject); 
    procedure DBGridEh2Enter(Sender: TObject);
    procedure DBGridEh3Enter(Sender: TObject);
    procedure DBGridEh4Enter(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure DBGridEh3TitleClick(Column: TColumnEh);
    procedure DBGridEh4TitleClick(Column: TColumnEh);
    procedure CheckBox2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    procedure init;
    procedure item_click(sender:TObject);
    { Private declarations }
  public
    newrkey : string;
    activedb : Integer;
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

uses common,Udm,UDetail, UQuery, ufrmadmin;

{$R *.dfm}

procedure TMain_Form.FormCreate(Sender: TObject);
begin
   activedb := 0;
  if not App_Init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;


  { dm.ADOConnection1.Open;
  rkey73:= '96';
  user_ptr := '110';
  vprev := '4';
    }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TMain_Form.init;
begin

    field_name := DBGridEh1.Columns[1].FieldName;
    PreColumn := DBGridEh1.Columns[1];
    DBGridEh1.Columns[1].Title.Color := clred ;
    Self.sSql:= DM.employee_contract.SQL.Text;
    with dm.tmp1 do
    begin
        dm.employee_contract.Close;
        close;
        SQL.Clear;
        sql.Text:='select getdate() as sys_date';
        open;
        dm.employee_contract.Parameters.ParamByName('dtpk1').Value:= StrToDateTime(fieldvalues['sys_date'])-3650;
        dm.employee_contract.Parameters.ParamByName('dtpk2').Value:=StrToDateTime(fieldvalues['sys_date'])+3650;
        dm.employee_contract.Parameters[2].Value := common.rkey73;
        dm.employee_contract.Open;

    end;
    label3.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);

    dm.employee_contract_2.Parameters[0].Value := common.rkey73;
    dm.employee_contract_2.Open;
    DM.employee_contract_2.Filter :='employee_typeitem='+#39+'正式合同'+#39;
    label5.Caption := inttostr(dbgrideh2.DataSource.DataSet.RecordCount);

    dm.employee_contract_3.Parameters[0].Value := common.rkey73;
    dm.employee_contract_3.Parameters[1].Value := common.rkey73;
    dm.employee_contract_3.Open;
    DM.employee_contract_3.Filter :='employee_typeitem='+#39+'正式合同'+#39;
    label7.Caption := inttostr(dbgrideh3.DataSource.DataSet.RecordCount);

    dm.employee_contract_4.Parameters[0].Value := common.rkey73;
    dm.employee_contract_4.Open;
    DM.employee_contract_4.Filter :='employee_typeitem='+#39+'正式合同'+#39; 
    label8.Caption := inttostr(dbgrideh4.DataSource.DataSet.RecordCount);
  
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TMain_Form.BitBtn3Click(Sender: TObject);
var
 v_rkey: integer;
begin
v_rkey := 0;
if not DM.employee_contract.IsEmpty
then  v_rkey := DM.employee_contractrkey.Value;
 DM.employee_contract.Close;
 DM.employee_contract.Open;
if v_rkey > 0 then  DM.employee_contract.Locate('rkey',v_rkey,[]);
 label3.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);
 dm.employee_contract_2.Close;
 dm.employee_contract_3.Close;
 dm.employee_contract_4.Close;
 dm.employee_contract_2.Parameters[0].Value := common.rkey73;
 dm.employee_contract_2.Open;
 label5.Caption := inttostr(dbgrideh2.DataSource.DataSet.RecordCount);
 dm.employee_contract_3.Parameters[0].Value := common.rkey73;
 dm.employee_contract_3.Parameters[1].Value := common.rkey73;
 dm.employee_contract_3.Open;
 label7.Caption := inttostr(dbgrideh3.DataSource.DataSet.RecordCount);
 dm.employee_contract_4.Parameters[0].Value := common.rkey73;
 dm.employee_contract_4.Open;
 label8.Caption := inttostr(dbgrideh4.DataSource.DataSet.RecordCount);
end;

procedure TMain_Form.BtQryClick(Sender: TObject);
var
 i:byte;
begin
with Query_Form do
 begin
      with dm.tmp do
      begin
        close;
        sql.Text:='select getdate() as sys_date';
        open;
        dtpk2.Date:=StrToDateTime(fieldvalues['sys_date']);
        dtpk1.Date:=dtpk2.Date-1100;
      end;
  dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',dm.employee_contract.Parameters.ParamValues['dtpk1']));
  dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',dm.employee_contract.Parameters.ParamValues['dtpk2']-1));
   if ShowModal=mrok then
   with dm.employee_contract do
    begin
     close;
     SQL.Text:=self.sSql+#13;
     for i:=1 to SGrid1.RowCount-2 do
        SQL.Text:=dm.employee_contract.SQL.Text+SGrid1.Cells[2,i]+#13;

      Parameters.ParamValues['dtpk1']:=strtodate(
          formatdatetime('yyyy-mm-dd ',dtpk1.Date));
      Parameters.ParamValues['dtpk2']:=strtodate(
          formatdatetime('yyyy-mm-dd ',dtpk2.Date+1));
      Parameters[2].Value := common.rkey73;
     open;
     label3.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);
    end;
  end;
  BitBtn3Click(Sender);
end;

procedure TMain_Form.BitBtn4Click(Sender: TObject);
begin   
case activedb of
1:   if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'员工合同') ;
2:   if DBGridEh2.DataSource.DataSet.Active then
              if DBGridEh2.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh2,'未录合同员工') ;
3:   if DBGridEh3.DataSource.DataSet.Active then
              if DBGridEh3.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh3,'合同将到期员工') ;
4:   if DBGridEh4.DataSource.DataSet.Active then
              if DBGridEh4.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh4,'合同已失效员工') ;
end;
end;

procedure TMain_Form.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;

procedure TMain_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.employee_contract.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.employee_contract.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
  begin
        label1.Caption:=column.Title.Caption;
        self.field_name:=column.FieldName;
        edit1.SetFocus;
        PreColumn.Title.Color := clBtnFace;
        Column.Title.Color := clred;
        PreColumn := column;
  end
  else
      edit1.SetFocus;
end;

procedure TMain_Form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.employee_contract.SQL.Text);
end;

procedure TMain_Form.Edit1Change(Sender: TObject);
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
  label3.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);
end;

procedure TMain_Form.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  if dm.ADOConnection1.Connected then
  begin
      DBGridEh1TitleClick(PreColumn);
      for i:=1 to DBGridEh1.Columns.Count do
      begin
          item := TmenuItem.Create(self) ;
          item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;

          if DBGridEh1.Columns[i-1].Visible then
              item.Checked := true ;
              item.OnClick := item_click ;
              PopupMenu2.Items.Add(item) ;
      end;
  end;
    BitBtn3Click(nil);
    DBGridEh1TitleClick(DBGridEh1.Columns[1]);
    DBGridEh1TitleClick(DBGridEh1.Columns[1]);
    DM.employee_contract.Sort:='inputdate'+' DESC';
    dm.employee_contract.Filter := 'status=1';
    label3.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);
  panel2.Height := trunc(self.Height*0.382);
  image1.Left := self.Width-42;
  bitbtn7.Left := image1.Left-120;
  checkbox1.Left := bitbtn7.Left-140;
  checkbox2.Left := bitbtn7.Left-140;
  label3.Left :=  checkbox2.Left -50;
  label2.Left :=  label3.Left-75;
  edit1.Left := label2.Left- 75;
  label1.Left := edit1.Left- 55;
end;

procedure TMain_Form.BitBtn6Click(Sender: TObject);
begin
    popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMain_Form.N1Click(Sender: TObject);
begin
  DM.Tag := 0 ;
  if (Tmenuitem(Sender).Tag in [0,3]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
    case Tmenuitem(Sender).Tag of
      0: with TDetail_Form.Create(nil) do
        begin
            Label5.Caption := rkey73;
            if showmodal=mrok then
            begin
                DM.employee_contract.Close;
                DM.employee_contract.Open;
                DM.employee_contract.Locate('rkey',newrkey,[]);
            end;
        end;

      3: begin

          if MessageBox(Handle,'确定删除此记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
              DM.ADOConnection1.BeginTrans;
              try
                DM.tmp1.Close;
                DM.tmp1.SQL.Clear;
                DM.tmp1.SQL.Text:='delete from employee_contract where rkey='+dm.employee_contractRkey.AsString;
                      if DM.tmp1.ExecSQL=0 then
                      begin
                        DM.ADOConnection1.RollbackTrans;
                        showmessage('删除数据失败,数据状态已发生变化...');
                      end else
                        DM.ADOConnection1.CommitTrans;
                        BitBtn3Click(nil);
             except
               DM.ADOConnection1.RollbackTrans;
               showmessage('删除数据失败...');
             end;

         end;
    end;
end;

procedure TMain_Form.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dm.employee_contractstatus.Value = 2 then
     DBGridEh1.Canvas.Font.Color := clGrayText;
     DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TMain_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    DM.employee_contract_1.Close;
    DM.employee_contract_2.Close;
    DM.employee_contract_3.Close;
    DM.employee_contract_4.Close;
    DM.employee_contract.Close;
end;

procedure TMain_Form.N5Click(Sender: TObject);
begin
  if (Tmenuitem(Sender).Tag in [0,3]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if DM.employee_contract.RecordCount <= 0 then
  begin
    ShowMessage('对不起，当前没有数据，不能进行编辑！');
    Exit;
  end;
  DM.Tag := 1;
  Detail_Form := TDetail_Form.Create(Application);
  Detail_Form.ShowModal;
  Detail_Form.Free;
  DM.employee_contract.Close;
  DM.employee_contract.Open;
  label3.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);
end;

procedure TMain_Form.N7Click(Sender: TObject);
var
i:integer;
s,date_s,yearmonth_s:string;
f :TDateTime;
begin
  if monthof(now)>=6 then
    yearmonth_s := copy(formatdatetime('yyyy-mm-dd ',incyear(now,3)),1,5)+'12-31'
  else
    yearmonth_s :=copy(formatdatetime('yyyy-mm-dd ',incyear(now,3)),1,5)+'06-01';
  //s:= InputBox('请输入结束日期','日期',yearmonth_s);

   if InputQuery('请输入结束日期','日期',yearmonth_s) then
      s:=yearmonth_s
   else
      Exit;

  if TryStrTodate(s,f) then
  begin
    if Messagedlg('确定批量修改选定数据的合同结束日期为'+s,mtWarning,[mbYES,mbNO],0)=6
    then
      begin
        for I := 0 to DBGridEh1.SelectedRows.Count - 1 do
        begin
          DM.employee_contract.GotoBookmark(Pointer(DBGridEh1.SelectedRows.Items[I]));
            dm.tmp.SQL.Clear;
            dm.tmp.SQL.Text := 'update employee_contract set '
              + 'enddate=' + QuotedStr(s) + ','
              + 'inputdate=' + QuotedStr(DateToStr(now)) + ','
              + 'opration_person=(select data0005.rkey from data0005 inner join '
              + 'data0073 on data0005.rkey=data0073.employee_ptr where data0073.rkey= '+ rkey73 +')'
              + 'where rkey = ' + IntToStr(DM.employee_contract.FieldValues['rkey']);
            dm.tmp.ExecSQL;
        end;
        dm.employee_contract.Requery();
      end;
    end
  else
    begin
      showmessage(s+'不是正确的日期，操作已取消');
    end;

end;

procedure TMain_Form.N6Click(Sender: TObject);
var
i:integer;
begin
      if Messagedlg('确定删除选定行吗？删除之后将无法恢复!',mtWarning,[mbYES,mbNO],0)=6
    then
      begin
        for I := 0 to DBGridEh1.SelectedRows.Count - 1 do
        begin
          DM.employee_contract.GotoBookmark(Pointer(DBGridEh1.SelectedRows.Items[I]));
            dm.tmp.SQL.Clear;
            dm.tmp.SQL.Text := 'delete from employee_contract  '+
            ' where rkey = ' + IntToStr(DM.employee_contract.FieldValues['rkey']);
            dm.tmp.ExecSQL;
        end;
        dm.employee_contract.Requery();
      end;
end;

procedure TMain_Form.N8Click(Sender: TObject);
var
i:integer;
begin
  if Messagedlg('确定批量修改选定数据为失效数据吗?',mtWarning,[mbYES,mbNO],0)=6  then
  begin
    for I := 0 to DBGridEh1.SelectedRows.Count - 1 do
    begin
    DM.employee_contract.GotoBookmark(Pointer(DBGridEh1.SelectedRows.Items[I]));
    dm.tmp.SQL.Clear;
    dm.tmp.SQL.Text := 'update employee_contract set '
    + 'status=2,'
    + 'inputdate=' + QuotedStr(DateToStr(now)) + ','
    + 'opration_person=(select data0005.rkey from data0005 inner join '
    + 'data0073 on data0005.rkey=data0073.employee_ptr where data0073.rkey= '+ rkey73 +')'
    + 'where rkey = ' + IntToStr(DM.employee_contract.FieldValues['rkey']);
    dm.tmp.ExecSQL;
    end;
    dm.employee_contract.Requery();
  end;

end;

procedure TMain_Form.N9Click(Sender: TObject);
var
i:integer;
begin
  if Messagedlg('确定批量修改选定数据为生效数据吗?',mtWarning,[mbYES,mbNO],0)=6  then
  begin
    for I := 0 to DBGridEh1.SelectedRows.Count - 1 do
    begin
    DM.employee_contract.GotoBookmark(Pointer(DBGridEh1.SelectedRows.Items[I]));
    dm.tmp.SQL.Clear;
    dm.tmp.SQL.Text := 'update employee_contract set '
    + 'status=1,'
    + 'inputdate=' + QuotedStr(DateToStr(now)) + ','
    + 'opration_person=(select data0005.rkey from data0005 inner join '
    + 'data0073 on data0005.rkey=data0073.employee_ptr where data0073.rkey= '+ rkey73 +')'
    + 'where rkey = ' + IntToStr(DM.employee_contract.FieldValues['rkey']);
    dm.tmp.ExecSQL;
    end;
    dm.employee_contract.Requery();
  end;
end;

procedure TMain_Form.N11Click(Sender: TObject);
begin
  if (Tmenuitem(Sender).Tag in [0,3]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if DM.employee_contract.RecordCount <= 0 then
  begin
    ShowMessage('对不起，当前没有数据，不能进行编辑！');
    Exit;
  end;
  DM.Tag := 3;
  Detail_Form := TDetail_Form.Create(Application);
  Detail_Form.ShowModal;
  Detail_Form.Free;
  DM.employee_contract.Close;
  DM.employee_contract.Open;
  label3.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);
end;

procedure TMain_Form.N31Click(Sender: TObject);
var
i:integer;
s,date_s,yearmonth_s:string;
f :TDateTime;
begin
  if (Tmenuitem(Sender).Tag in [0,3]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if DM.employee_contract.RecordCount <= 0 then
  begin
    ShowMessage('对不起，当前没有数据，不能进行编辑！');
    Exit;
  end;

  if monthof(now)>=6 then
    yearmonth_s := copy(formatdatetime('yyyy-mm-dd ',incyear(now,3)),1,5)+'12-31'
  else
    yearmonth_s :=copy(formatdatetime('yyyy-mm-dd ',incyear(now,3)),1,5)+'06-01';
  //s:= InputBox('请输入结束日期','日期',yearmonth_s);

   if InputQuery('请输入结束日期','日期',yearmonth_s) then
      s:=yearmonth_s
   else
      Exit;

  if TryStrTodate(s,f) then
  begin
    if Messagedlg('确定批量续签的合同结束日期为'+s,mtWarning,[mbYES,mbNO],0)=6
    then
      begin
        for I := 0 to DBGridEh1.SelectedRows.Count - 1 do
        begin
          DM.employee_contract.GotoBookmark(Pointer(DBGridEh1.SelectedRows.Items[I]));
            dm.tmp.SQL.Clear;
            dm.tmp.SQL.Text := 'update employee_contract set '
              + 'startdate=dateadd(day,1,enddate)'+ ','
             { + 'probationdate=null'+ ','}
              + 'enddate='+QuotedStr(s)+ ','
              + 'remark=remark+'+#39+'  原合同从'+#39
              + ' +substring(convert(nvarchar(20),startdate,120),1,10)'+'+'+#39
              +'到'+#39+'+substring(convert(nvarchar(20),enddate,120),1,10)'+'+'+#39
              +'结束'+#39+ ','
              + 'inputdate=' + QuotedStr(DateToStr(now)) + ','
              + 'status=1,'
              + 'opration_person=(select data0005.rkey from data0005 inner join '
              + 'data0073 on data0005.rkey=data0073.employee_ptr where data0073.rkey= '+ rkey73 +')'
              + 'where rkey = ' + IntToStr(DM.employee_contract.FieldValues['rkey']);
            dm.tmp.ExecSQL;
        end;
        showmessage('批量续签完成');
        dm.employee_contract.Requery();
        {dm.employee_contract.Close;
        dm.employee_contract.Open;}
        dm.employee_contract.Sort :='inputdate  DESC';
      end;
    end
  else
    begin
      showmessage(s+'不是正确的日期，操作已取消');
    end; 
end;



procedure TMain_Form.DBGridEh2Enter(Sender: TObject);
begin
  activedb := 2;
end;

procedure TMain_Form.DBGridEh3Enter(Sender: TObject);
begin
activedb := 3;
end;

procedure TMain_Form.DBGridEh4Enter(Sender: TObject);
begin
activedb := 4;
end;

procedure TMain_Form.DBGridEh1Enter(Sender: TObject);
begin
 activedb := 1;
end;

procedure TMain_Form.DBGridEh2TitleClick(Column: TColumnEh);
begin
 if DBGridEh2.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.employee_contract_2.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.employee_contract_2.Sort:=Column.FieldName+' DESC';
  end; 
end;

procedure TMain_Form.DBGridEh3TitleClick(Column: TColumnEh);
begin
 if DBGridEh3.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.employee_contract_3.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.employee_contract_3.Sort:=Column.FieldName+' DESC';
  end;
end;

procedure TMain_Form.DBGridEh4TitleClick(Column: TColumnEh);
begin
 if DBGridEh4.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.employee_contract_4.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.employee_contract_4.Sort:=Column.FieldName+' DESC';
  end;
end;

procedure TMain_Form.CheckBox2Click(Sender: TObject);
begin
    if CheckBox1.Checked then
    begin

      if CheckBox2.checked then
      begin
        DM.employee_contract.Filter :='type=447';
        DM.employee_contract_2.Filter :='employee_typeitem='+#39+'正式合同'+#39;
        DM.employee_contract_3.Filter :='employee_typeitem='+#39+'正式合同'+#39;
        DM.employee_contract_4.Filter :='employee_typeitem='+#39+'正式合同'+#39;
      end
      else
      begin
        DM.employee_contract.Filter :='';
        DM.employee_contract_2.Filter :='';
        DM.employee_contract_3.Filter :='';
        DM.employee_contract_4.Filter :='';
      end;
    end
  else
    begin
      if CheckBox2.checked then
      begin
        DM.employee_contract.Filter :='status=1 and type=447';
        DM.employee_contract_2.Filter :='employee_typeitem='+#39+'正式合同'+#39;
        DM.employee_contract_3.Filter :='employee_typeitem='+#39+'正式合同'+#39;
        DM.employee_contract_4.Filter :='employee_typeitem='+#39+'正式合同'+#39;
      end
      else
      begin
        DM.employee_contract.Filter :='status=1';
        DM.employee_contract_2.Filter :='';
        DM.employee_contract_3.Filter :='';
        DM.employee_contract_4.Filter :='';
      end;
    end;

    label3.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);
    label7.Caption := inttostr(dbgrideh3.DataSource.DataSet.RecordCount);
    label5.Caption := inttostr(dbgrideh2.DataSource.DataSet.RecordCount);
    label8.Caption := inttostr(dbgrideh4.DataSource.DataSet.RecordCount);


 end;

procedure TMain_Form.btn1Click(Sender: TObject);
begin
 if dm.employee_contract_4.Eof then
 begin
   showmessage('无数据');
   exit;
 end;
 dm.qry1.Parameters[0].Value :=  common.rkey73;
 try
  dm.qry1.ExecSQL;
  showmessage('处理完毕');
 except
  showmessage('处理失败');
 end;
  bitbtn3.Click();
end;

procedure TMain_Form.FormResize(Sender: TObject);
begin
  panel2.Height := trunc(self.Height*0.382);
  image1.Left := self.Width-42;
  bitbtn7.Left := image1.Left-120;
  checkbox1.Left := bitbtn7.Left-140;
  checkbox2.Left := bitbtn7.Left-140;
  label3.Left :=  checkbox2.Left -50;
  label2.Left :=  label3.Left-75;
  edit1.Left := label2.Left- 75;
  label1.Left := edit1.Left- 55;
end;




procedure TMain_Form.BitBtn8Click(Sender: TObject);
begin
  // ShowMessage('1');
    try

    frmadmin := Tfrmadmin.Create(nil);
    DM.employee_contract_5.Parameters[0].Value := rkey73;
    DM.employee_contract_6.Parameters[0].Value := rkey73;
    DM.employee_contract_5.Open;
    DM.employee_contract_6.Open;
    frmadmin.ShowModal;
  finally
    DM.employee_contract_5.close;
    DM.employee_contract_6.close;
    frmadmin.Free;
    end;

end;


procedure TMain_Form.BitBtn7Click(Sender: TObject);
begin
 if (Tmenuitem(Sender).Tag in [0,3]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if bitbtn7.Tag = 0 then
  begin
    bitbtn7.Caption := '切换到单条编辑模式';
    bitbtn7.Tag := 1;
    bitbtn7.Font.Color := clred;
    dbgrideh1.PopupMenu := popupmenu3;
    dbgrideh1.Options := dbgrideh1.Options + [dgMUltiSelect]+[dgrowselect];
  end
  else
  begin
    bitbtn7.Caption := '切换到批量编辑模式';
    bitbtn7.Tag := 0;
    bitbtn7.Font.Color := clgreen;
     dbgrideh1.PopupMenu := popupmenu1;
     dbgrideh1.Options := dbgrideh1.Options - [dgMUltiSelect]-[dgrowselect];
    // dbgrideh1.Options.dgmultiselect := false;
  end;
{      if MessageBox(Handle,'更新操作不可逆，确定更新所有合同状态吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
              DM.ADOConnection1.BeginTrans;
              try
                DM.tmp2.Close;
                DM.tmp2.SQL.Clear;
                DM.tmp2.SQL.Text:='update employee_contract set status = 2 where enddate < getdate() ';
                      if DM.tmp2.ExecSQL=0 then
                      begin
                        DM.ADOConnection1.RollbackTrans;
                        showmessage('更新数据失败,数据状态已发生变化...');
                      end else
                        DM.ADOConnection1.CommitTrans;
               BitBtn3Click(nil);
             except
               DM.ADOConnection1.RollbackTrans;
               showmessage('删除数据失败...');
             end;
}
end;

end.
