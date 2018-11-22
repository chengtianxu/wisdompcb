unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, ComCtrls, DBCtrls, Mask, DBCtrlsEh, DBGrids;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N12: TMenuItem;
    N_Delete: TMenuItem;
    N7: TMenuItem;
    N5: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Grd1: TDBGridEh;
    DBMemo1: TDBMemo;
    lbl1: TLabel;
    N6: TMenuItem;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    DBMemo2: TDBMemo;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBGrid1: TDBGrid;
    DBMemo3: TDBMemo;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    BitBtn1: TBitBtn;
    PopupMenu2: TPopupMenu;
    BitBtn2: TBitBtn;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure item_Click(Sender:TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N15Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    Log_USER_FULL_NAME,Log_USER_LOGIN_NAME  :string;
    procedure init;
  public
    Function  GetSmallDatetime(Qry:TADOQuery):TDateTime;
  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u,Frm_detail_u,Frm_YS_u,employee,formInputDlg,
  form_See,formGetUserRights;
{$R *.dfm}

Function  TFrm_main.GetSmallDatetime(Qry:TADOQuery):TDateTime;
begin
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text:='select cast(getdate()as smallDatetime)'  ;
  Qry.Open;
  Result:=Qry.FieldList[0].AsDateTime;
end;

procedure TFrm_main.FormCreate(Sender: TObject);
begin    { }
  if not App_init_2(dm.ADOCon) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
    exit;
  end;  
  { 
  dm.ADOCon.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOCon.Open;
  rkey73:='2537';
  user_ptr := '785';
  vprev := '4';}
  
  if DM.qry_D0846All.Active =False then
  DM.qry_D0846All.Open;

  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select EMPLOYEE_PTR,USER_FULL_NAME,USER_LOGIN_NAME from data0073 where  rkey='+rkey73;
    Open;
    user_ptr:=Fields[0].AsString;
    StatusBar1.Panels[1].Text:='用户名：'+trim(FieldValues['USER_FULL_NAME'])+' ('+trim(FieldValues['USER_LOGIN_NAME'])+')';
    Log_USER_FULL_NAME:=FieldValues['USER_FULL_NAME'];
    Log_USER_LOGIN_NAME:=FieldValues['USER_LOGIN_NAME'];
    Close;
  end;
  Caption := application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.ADO567.IsEmpty then exit;
  i := DM.ADO567rkey.AsInteger ;
  DM.ADO567.Close;
  DM.ADO567.Open;
  DM.ADO567.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO567.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO567.Sort:=Column.FieldName+' DESC';
  end;

  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_main.init;
var da:TDateTime;
item:TMenuItem;
i:Byte;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  da:=Now;
  sSql:=DM.ADO567.SQL.Text;
  DM.ADO567.SQL.Text:=DM.ADO567.SQL.Text+ 'where (data0567.ent_date>='+quotedstr(formatdatetime('YYYY-MM-DD',da-7)) +')'+
  ' and (data0567.ent_date <='+quotedstr(formatdatetime('YYYY-MM-DD',da+1))+')'+' and data0567.status in (0,1,3,6) '+#13+' order by data0567.number';
  DM.ADO567.Open;
  for i:=0  to Grd1.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=Grd1.Columns[i].Title.Caption;
    if Grd1.Columns[i].Visible=True then item.Checked:=True;
    item.OnClick:=item_Click;
    PopupMenu2.Items.Add(item);
  end;
end;

procedure TFrm_main.item_Click(Sender:TObject);
var i:Byte;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked then
  begin
    for i :=0  to Grd1.Columns.Count-1 do
    begin
      if (Sender as TMenuItem).Caption=Grd1.Columns[i].Title.Caption then
      begin
        Grd1.Columns[i].Visible:=True;
        Break;
      end;
    end;
  end
  else
  begin
    for i := 0 to Grd1.Columns.Count-1 do
    begin
      if (Sender as TMenuItem).Caption=Grd1.Columns[i].Title.Caption then
      begin
        Grd1.Columns[i].Visible:=False;
        Break;
      end;
    end;
  end;
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO567status.Value = 2 then
     Grd1.Canvas.Font.Color := clred
  else if dm.ADO567status.Value = 1 then
     Grd1.Canvas.Font.Color := clTeal //cllime
  else if dm.ADO567status.Value = 0 then
     Grd1.Canvas.Font.Color := clfuchsia
  else if dm.ADO567status.Value = 3 then
     Grd1.Canvas.Font.Color := clGreen;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if DM.ADO567.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //提交审批
    N_Delete.Enabled:=false;    //删除
    n5.Enabled:=false;    //取消提交
    n6.Enabled:=false;    //验收
    N8.Enabled:=false;    //验收退回
    N9.Enabled:=false;    //投诉
  end
  else
  begin
    n2.Enabled:=(dm.ADO567status.Value=0) or (dm.ADO567status.Value=5) ;
    n3.Enabled:=n2.Enabled and(DM.ADO567EMPL_PTR.Value=StrToInt(user_ptr));
    N_Delete.Enabled :=n2.Enabled and (DM.ADO567STATUS.AsInteger in [0,5]);
    n5.Enabled:=(dm.ADO567status.Value=1)
     and (dm.ADO567EMPL_PTR.Value =StrToInt(user_ptr))
     ;
    n6.Enabled:=dm.ADO567status.Value=3;
    N8.Enabled:=(dm.ADO567status.Value=3)and(DM.ADO567EMPL_PTR.Value=StrToInt(user_ptr));
    N9.Enabled:=(DM.ADO567EMPL_PTR.Value=StrToInt(user_ptr));
  end;
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    DM.ADO567.SQL.Text:=sSql+' where data0567.ent_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and data0567.ent_date<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date+1)+''' '+Sqlstr+
                           ' order by data0567.number';
    DM.ADO567.Close;
    DM.ADO567.Open;
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO567.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
var
    vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

    case Tmenuitem(Sender).Tag of      //新建 编辑
      0,1: with TFrm_detail.Create(nil) do
      try
        Ftag:=Tmenuitem(Sender).Tag;
        initd;
        if showmodal=mrok then
        begin
         DM.ADO567.Close;
         DM.ADO567.Open;
         DM.ADO567.Locate('rkey',Frkey567,[]);
        end;
      finally
        free;
        DM.ADO567_1.Close;
        DM.ADO567_1.Close;
      end;

      2:
      begin   //提交受理
        try
          DM.ADOCon.BeginTrans;
          DM.tmp.Close;
          DM.tmp.SQL.Text:='update data0567 set status=1,referring_date=getdate() where rkey='+DM.ADO567rkey.AsString+' and status in (0,5)' ;
          if DM.tmp.ExecSQL=0 then
            showmessage('申请单状态发生改变而未能成功提交!')
          else
          begin
            with  DM.tmp do            //在DATA0841表添加一行状态的记录。
            begin
              Close;
              SQL.Text:='insert into [dbo].[DATA0841]([D567_ptr],[User_ptr],[Status_ptr],[Record_date])'
                    +'values('+DM.ADO567RKEY.AsString+','+rkey73+','+'1'+','
                    +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',GetSmallDatetime(DM.ADOQuery1)))
                    +')';
             // ShowMessage(DM.tmp.SQL.Text);
              ExecSQL;
            end;
          end;
          DM.ADOCon.CommitTrans;
        except
          on e:Exception do
          begin
            DM.ADOCon.RollbackTrans;
            ShowMessage('提交失败！'+#13#10+e.Message);
          end;
        end;
        BtBrushClick(nil);
      end;

      3:       //删除
      begin
        if GetUserRights(Self,dm.ADOCon,vUsernameRkey, vEmployeeRkey,vUser_rights,'删除',
              Log_USER_LOGIN_NAME) then
        begin
          if (strtoint(vUser_rights)in [2,4])=False then
          begin
            messagedlg('对不起,您没有权限！',mtinformation,[mbok],0)  ;
            Exit ;
          end;
          if (DM.ADO567EMPL_PTR.AsInteger<> StrToInt(vEmployeeRkey ))and(vUser_rights='2')then
          begin
            messagedlg('你只能删除自己的申请单。',mtinformation,[mbok],0)  ;
            Exit ;
          end;
//
//          if MessageBox(Handle,'确定删除此维修单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
//          exit;
          try
            Screen.Cursor := crHourGlass;
            try
              DM.ADOCon.BeginTrans;
              with DM.tmp do
              begin
                Close;
                SQL.Text:='delete  data0841 where D567_ptr='+DM.ADO567rkey.AsString;
                ExecSQL;

                Close;
                SQL.Text:='delete  data0842 where Work_ptr='+DM.ADO567rkey.AsString;
                ExecSQL;

                Close;
                SQL.Text:='delete  data0567 where rkey='+DM.ADO567rkey.AsString;//+' and status in (0,5)' ;
               // ShowMessage(SQL.Text);
                if DM.tmp.ExecSQL<>1 then
                  showmessage('删除数据失败,数据状态已发生变化...');

              end;
              DM.ADOCon.CommitTrans;
            except
              on e:Exception do
              begin
                ShowMessage('失败！'+#13#10+e.Message);
                DM.ADOCon.RollbackTrans;
              end;
            end;
            BtBrushClick(nil);
          finally
            Screen.Cursor := crDefault;
          end;
        end;
      end;

      4:       //取消提交
      begin
        try
          DM.ADOCon.BeginTrans;

          if MessageBox(Handle,'确定取消提交此单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          DM.tmp.Close;
          DM.tmp.SQL.Text:='update data0567 set status=0,referring_date=null where rkey='+DM.ADO567rkey.AsString+' and status=1' ;
          if DM.tmp.ExecSQL<>1 then
            showmessage('取消提交此单失败,数据状态已发生变化...')
          else
          with  DM.tmp do            //在DATA0841表添加一行状态的记录。
          begin
            Close;
            SQL.Text:='insert into [dbo].[DATA0841]([D567_ptr],[User_ptr],[Status_ptr],[Record_date])'
                  +'values('+DM.ADO567RKEY.AsString+','+rkey73+','+'0'+','
                  +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',GetSmallDatetime(DM.ADOQuery1)))
                  +')';
           // ShowMessage(DM.tmp.SQL.Text);
            ExecSQL;
          end;

          DM.ADOCon.CommitTrans;
        except
          on e:Exception do
          begin
            DM.ADOCon.RollbackTrans;
            ShowMessage('提交失败！'+#13#10+e.Message);
          end;

        end;
        BtBrushClick(nil);
      end;

      5:  //验收 按钮
      if (DM.ADO567fail_type.AsString='') or (DM.ADO567maintain_text.AsString='') or (DM.ADO567maintain_empl.AsString='') then
         showmessage('维修部还未将异常类别、维修记录、维修人员输入完整,不能进行验收!')
      else
      begin
        if DM.ADO567EMPL_PTR.Value<>StrToInt(user_ptr) then
        begin
          messagedlg('对不起!该维修申请单不是您申报的',mtinformation,[mbok],0);
          abort;
        end;
        with TFrm_YS.Create(nil) do
        try
          PDValiDate.DateTime:=now;
          EdtValMan.Text:= DM.ADO567EMPLOYEE_NAME.Value;
          EdtValMan.Tag:=DM.ADO567EMPL_PTR.Value;
          if showmodal=mrok then
          begin
            try
              DM.ADOCon.BeginTrans;
              DM.tmp.Close;
              DM.tmp.SQL.Text:='update data0567 set status=4,validate_date='''+FormatDateTime('yyyy-MM-dd H:mm:ss',PDValiDate.DateTime)+
                               ''',validate_emplptr='+inttostr(EdtValMan.tag)+
                               ',validate_appraise='+QuotedStr(CBAppr.Text)
                               +',validate_Description='+QuotedStr(Memo1.Text)
                               +'  where rkey='+DM.ADO567rkey.AsString+' and status=3' ;
             // ShowMessage(DM.tmp.SQL.Text);
              if DM.tmp.ExecSQL<>1 then
                showmessage('验收此维修单失败,数据状态已发生变化...')
              else
              with  DM.tmp do            //在DATA0841表添加一行状态的记录。
              begin
                Close;
                SQL.Text:='insert into [dbo].[DATA0841]([D567_ptr],[User_ptr],[Status_ptr],[Record_date])'
                      +'values('+DM.ADO567RKEY.AsString+','+rkey73+','+'4'+','
                      +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',GetSmallDatetime(DM.ADOQuery1)))
                      +')';
               // ShowMessage(DM.tmp.SQL.Text);
                ExecSQL;
              end;
              DM.ADOCon.CommitTrans;
            except
              on e:Exception do
              begin
                DM.ADOCon.RollbackTrans;
                ShowMessage('提交失败！'+#13#10+e.Message);
              end;
            end;
            BtBrushClick(nil);
          end;
        finally
          free;
        end;
      end;
    end;

end;


procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_main.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex=1) and not DM.ADO567.IsEmpty then
  begin
    DM.ADO568.Close;
    DM.ADO568.Parameters[0].Value:=DM.ADO567RKEY.Value;
    DM.ADO568.Open;
  end;
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  PopupMenu2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
begin
  Frm_employee:=TFrm_employee.Create(Application);
  Frm_employee.ADO32.Open;
  Frm_employee.ShowModal;
end;

procedure TFrm_main.N8Click(Sender: TObject);
var
  vResultString:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  
  if InputDlg(self.Handle,Self.Caption,'输入验收退回原因',vResultString) then
  begin
    try
      DM.ADOCon.BeginTrans;
      DM.tmp.Close;
      DM.tmp.SQL.Text:='update data0567 set status=8'//validate_date='''+FormatDateTime('yyyy-MM-dd H:mm:ss',PDValiDate.DateTime)+
                       +#13+'where rkey='+DM.ADO567rkey.AsString+' and status=3' ;
    //  ShowMessage(DM.tmp.SQL.Text);
      if DM.tmp.ExecSQL<>1 then
        showmessage('验收此维修单失败,数据状态已发生变化...');
      BtBrushClick(nil);

      with  DM.tmp do            //在DATA0841表添加一行验收退回状态的记录。
      begin
        Close;
        SQL.Text:='insert into [dbo].[DATA0841]([D567_ptr],[User_ptr],[Status_ptr],[Record_date],[remark])'
              +'values('+DM.ADO567RKEY.AsString+','+rkey73+','+'8'+','
              +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',GetSmallDatetime(DM.ADOQuery1)))
              +','+QuotedStr(vResultString)+')';
       // ShowMessage(DM.tmp.SQL.Text);
        ExecSQL;
      end;

      DM.ADOCon.CommitTrans;
    except
      on e:Exception do
      begin
        DM.ADOCon.RollbackTrans;
        ShowMessage('提交失败！'+#13#10+e.Message);
      end;
    end;
  end;
end;

procedure TFrm_main.N9Click(Sender: TObject);
var
  vResultString:string;
begin
  if InputDlg(self.Handle,Self.Caption,'输入投诉的内容',vResultString) then
  begin
    with  DM.tmp do   //7　投诉
    begin
      Close;
      SQL.Text:='insert into [dbo].[DATA0841]([D567_ptr],[User_ptr],[Status_ptr],[Record_date],[remark])'
            +'values('+DM.ADO567RKEY.AsString+','+rkey73+','+'7'+','
            +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',GetSmallDatetime(DM.ADOQuery1)))
            +','+QuotedStr(vResultString)+')';
      //ShowMessage(DM.tmp.SQL.Text);
      ExecSQL;
    end;
  end;

end;

procedure TFrm_main.N11Click(Sender: TObject);
begin
  if Assigned(frm_See)=False then
    Application.CreateForm(Tfrm_See, frm_See);
  with DM do
  begin
    qry_841.Close;
    qry_841.Parameters.ParamByName('vD567_ptr').Value:=ADO567rkey.Value;
    qry_841.Open;
    frm_See.DataSource1.DataSet:=qry_841;
    frm_See.Caption:=(Sender as TMenuItem).Caption;
    frm_See.ShowModal;
  end;
end;

procedure TFrm_main.N13Click(Sender: TObject);
begin
  if Assigned(frm_See)=False then
    Application.CreateForm(Tfrm_See, frm_See);
  with DM do
  begin
    qry_841_1.Close;
    qry_841_1.Parameters.ParamByName('vD567_ptr').Value:=ADO567rkey.Value;
    qry_841_1.Open;
    frm_See.DataSource1.DataSet:=qry_841_1;
    frm_See.Caption:=(Sender as TMenuItem).Caption;
    frm_See.ShowModal;
  end;
end;

procedure TFrm_main.FormActivate(Sender: TObject);
begin
  WindowState:= wsMaximized;
end;

procedure TFrm_main.N15Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin   //GetUserRights
  if GetUserRights(Self,DM.ADOCon,vUsernameRkey, vEmployeeRkey,vUser_rights,'重置登陆用户名') then
  begin
    vprev:= vUser_rights;
    rkey73:=vUsernameRkey;
    user_ptr:=vEmployeeRkey;
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select d3.USER_FULL_NAME,d3.USER_LOGIN_NAME,d3.EMPLOYEE_PTR,d5.EMPLOYEE_NAME,d5.EMPL_CODE '
          +' from data0073 d3 left join data0005 d5 on d3.EMPLOYEE_PTR=d5.rkey where d3.rkey='+rkey73;
    DM.tmp.Open;
    StatusBar1.Panels[1].Text:='用户名：'+trim(DM.tmp.FieldValues['USER_FULL_NAME'])+' ('+trim(DM.tmp.FieldValues['USER_LOGIN_NAME'])+')';
    DM.tmp.Close;
    ShowMessage('你已重置当前程序的登陆用户名，操作完成后务必关闭！！！');
  end;
end;

end.
