unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ComCtrls, ADODB, DB, Grids, DBGrids, Buttons, StrUtils, CommCtrl,
  Menus, DM, AppEvnts, ToolWin, ExtCtrls, DBGridEh, DateUtils;

{type
  TListView   =   class(ComCtrls.TListView)
      procedure   WMVScroll(var   Message:   TMessage);   message   WM_VSCROLL;
      procedure   WMHScroll(var   Message:   TMessage);   message   WM_HSCROLL;
  end;}


type
  TFrmMain = class(TForm)
    tv1: TTreeView;
    il1: TImageList;
    lv1: TListView;
    dbgrd1: TDBGrid;
    grb_1: TGroupBox;
    grb_2: TGroupBox;
    grb_3: TGroupBox;
    lb_11: TLabel;
    edt_Operator: TEdit;
    bbt_5: TBitBtn;
    edt_OperateDate: TEdit;
    lb_1: TLabel;
    bbt_7: TBitBtn;
    lb_2: TLabel;
    dtpDate: TDateTimePicker;
    pm_1: TPopupMenu;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    DBGrd2: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    dgh_grd1: TDBGridEh;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    edt_1: TEdit;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    DateTimePicker2: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    Label4: TLabel;
    Panel2: TPanel;
    lblCountZ: TLabel;
    lblCountB: TLabel;
    lblCountW: TLabel;
    BitBtn5: TBitBtn;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure tv1Click(Sender: TObject);
    procedure dbgrd1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbt_1Click(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure lv1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure bbt_5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbt_7Click(Sender: TObject);
    procedure bbt_4Click(Sender: TObject);
    procedure pm_1Popup(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure dgh_grd1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure lblCountWClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    OldGridWnd : TWndMethod;
    PreColumn: TColumnEh;
    field_name, starSQL5, starSQL6:string;
    procedure NewGridWnd (var Message : TMessage);
    procedure PageIndex;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  Pick_Item_Single, ConstVar, OutInInfoFrm, OnOutBedInfo, UpInDate, UpOutDate, WInfo,
  common;

{$R *.dfm}

procedure TFrmMain.NewGridWnd(var Message: TMessage);
var
  IsNeg: Boolean;
  i: Integer;
  PListItem: TListItem;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrd1.DataSource.DataSet.MoveBy(1)
   else
     DBGrd1.DataSource.DataSet.MoveBy(-1);
  damo.qry7.Close;
  damo.qry7.Parameters.ParamValues['BedroomRkey'] := damo.qry2.FieldValues['rkey'];
  damo.qry7.Open;
  lv1.Items.Clear;
  if not damo.qry2.FieldByName('rkey').IsNull then
  begin
    damo.qry3.Close;
    damo.qry3.SQL.Clear;
    damo.qry3.SQL.Text := 'SELECT Bedmsg.rkey,bedroomid,B_code,employeeid,remark,effective, employeemsg_extra.chinesename '
      + 'FROM Bedmsg left join employeemsg_extra on Bedmsg.employeeid=employeemsg_extra.rkey '
      + 'where bedroomid=' + IntToStr(damo.qry2.FieldValues['rkey'])+' order by B_code ';
    damo.qry3.Open;
    damo.qry3.First;

    for i := 0 to damo.qry3.RecordCount - 1 do
    begin
      PListItem := lv1.Items.Add; //增加节点

      if damo.qry3.FieldByName('chinesename').IsNull then
        PListItem.Caption := damo.qry3.FieldValues['B_code'];

      if not damo.qry3.FieldByName('chinesename').IsNull then
        PListItem.Caption := damo.qry3.FieldValues['B_code'] + '----' + damo.qry3.FieldValues['chinesename'];

      if not damo.qry3.FieldByName('employeeid').IsNull then
        PListItem.ImageIndex := 1
      else
        PListItem.ImageIndex := 2 ;
      damo.qry3.Next;
    end;
  end;
 end
 else
   OldGridWnd(Message);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  CountZ, CountB: Integer;
begin
  if not App_Init(damo.con1) then
  begin
    common.ShowMsg('程序启动失败,请联系系统管理员',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;
  {rkey73:='1';
  vprev:='4'; }
  with damo.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select rkey, employee_name from data0005 where data0005.rkey= '+ user_ptr;
    open;
    edt_Operator.Text := fieldbyName('employee_name').AsString;
    edt_Operator.Tag := fieldbyName('rkey').AsInteger;
  end;
  dtpDate.DateTime := Now;
  edt_OperateDate.Text := DateToStr(Now);
  OldGridWnd := DBGrd1.WindowProc;
  DBGrd1.WindowProc := NewGridWnd;
  starSQL5 := damo.qry5.SQL.Text;
  starSQL6 := damo.qry6.SQL.Text;
  with damo.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select count(*) as CountTotal from employeemsg_extra where isnull(roomcode, '''') <> '''' ';
    open;
    CountZ := FieldValues['CountTotal'];
    lblCountZ.Caption := '宿舍当前入住总人数：' +  IntToStr(CountZ);

    Close;
    SQL.Clear;
    SQL.Text := 'select count(*) as CountTotal from employeemsg_extra where isnull(roomcode, '''') <> '''' and flag=0 ';
    open;
    CountB := FieldValues['CountTotal'];
    lblCountB.Caption := '本厂入住总人数：' +  IntToStr(CountB);
    lblCountW.Caption := '外来人员入住总人数：' + IntToStr(CountZ - CountB);
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  node, node1, node2: TTreeNode;
  PListItem: TListItem;
  i, DormistoryIndex, DormistoryRkey: Integer;
  D_PercentStr, B_PercentStr, DormistoryStr: string;
begin
  SendMessage(lv1.Handle, LVM_SETICONSPACING, 0, MakeLong(130, 55));
  damo.qry1.Close;
  damo.qry1.SQL.Clear;
  damo.qry1.SQL.Text := 'select rkey,D_Code,D_Name,D_Floor,remark,effective from Dormitorymsg where effective=1';
  damo.qry1.Open;

  damo.qry2.Close;
  damo.qry2.SQL.Clear;
  damo.qry2.SQL.Text := 'Select Bedroommsg.[rkey],Dormitorymsg.rkey,employeemsg_extra.rkey,[dormitoryid],[R_code],[bedcount],[floor],R_name, '
    + 'case when type=0 then ''女'' when type=1 then ''男'' when type=2 then ''家庭'' end type, [grade],[monitor], '
    + 'employeemsg_extra.chinesename,[equipment_remark],Bedroommsg.[remark],Dormitorymsg.D_code, '
    + '(select count(*) from bedmsg where employeeid is not null and bedroomid=Bedroommsg.[rkey] and bedmsg.effective=1) FullBedCount, '
    + '([bedcount]-(select count(*) from bedmsg where employeeid in (select rkey from employeemsg_extra) and bedroomid=Bedroommsg.[rkey])) NowBedCount '
    + 'FROM Bedroommsg inner join Dormitorymsg on Dormitorymsg.rkey=Bedroommsg.dormitoryid '
    + 'left join employeemsg_extra on employeemsg_extra.rkey=Bedroommsg.monitor where Bedroommsg.effective=1 '
    + 'order by R_Code';
  damo.qry2.Open;

  damo.qry7.Close;
  damo.qry7.Parameters.ParamValues['BedroomRkey'] := damo.qry2.FieldByName('rkey').AsInteger;
  damo.qry7.Open;

  damo.qry3.Close;
  damo.qry3.SQL.Clear;
  damo.qry3.SQL.Text := 'SELECT rkey,bedroomid,B_code,employeeid,remark,effective FROM Bedmsg';
  damo.qry3.Open;

  damo.qry1.First;
  while not damo.qry1.Eof do
  begin
    with damo.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT count(*) as NowCount, '
        + '(SELECT count(*) FROM Bedmsg inner join Bedroommsg on Bedmsg.bedroomid=Bedroommsg.rkey '
        + 'inner join Dormitorymsg on Bedroommsg.dormitoryid=Dormitorymsg.rkey '
        + 'where Dormitorymsg.rkey= ' + IntToStr(damo.qry1.FieldValues['rkey']) + ')as TotalCount '
        + 'FROM Bedmsg '
        + 'inner join Bedroommsg on Bedmsg.bedroomid=Bedroommsg.rkey '
        + 'inner join Dormitorymsg on Bedroommsg.dormitoryid=Dormitorymsg.rkey '
        + 'where employeeid is not null and Dormitorymsg.rkey= '+ IntToStr(damo.qry1.FieldValues['rkey']);
      Open;
      D_PercentStr := '(' + IntToStr(damo.qrytemp.FieldValues['NowCount']) + '/' + inttostr(damo.qrytemp.FieldValues['TotalCount']) + ')';
    end;
    node := TTreeNode.Create(tv1.Items);
    node := tv1.Items.AddChild(node, damo.qry1.fieldbyname('D_Name').AsString + D_PercentStr);
    for i := 0 to damo.qry1.fieldbyname('D_Floor').AsInteger - 1 do
    begin
      with damo.qrytemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'SELECT count(*) as NowCount, '
          + '(SELECT count(*) FROM Bedmsg inner join Bedroommsg on Bedmsg.bedroomid=Bedroommsg.rkey '
          + 'inner join Dormitorymsg on Bedroommsg.dormitoryid=Dormitorymsg.rkey '
          + 'where Dormitorymsg.rkey= ' + IntToStr(damo.qry1.FieldValues['rkey']) + ' and Bedroommsg.[floor] = ' + IntToStr(i+1) + ' ) as TotalCount '
          + 'FROM Bedmsg '
          + 'inner join Bedroommsg on Bedmsg.bedroomid=Bedroommsg.rkey '
          + 'inner join Dormitorymsg on Bedroommsg.dormitoryid=Dormitorymsg.rkey '
          + 'where employeeid is not null and Dormitorymsg.rkey= '+ IntToStr(damo.qry1.FieldValues['rkey'])
          + ' and Bedroommsg.[floor] = ' + IntToStr(i+1);
        Open;
        B_PercentStr := '(' + IntToStr(damo.qrytemp.FieldValues['NowCount']) + '/' + inttostr(damo.qrytemp.FieldValues['TotalCount']) + ')';
      end;
      node1 := tv1.Items.AddChild(node,'第 '+ IntToStr(i+1) +' 层' + B_PercentStr);
    end;
    damo.qry1.Next;
  end;

  lv1.Items.Clear;
  if not damo.qry2.FieldByName('rkey').IsNull then
  begin
    damo.qry3.Close;
    damo.qry3.SQL.Clear;
    damo.qry3.SQL.Text := 'SELECT Bedmsg.rkey,bedroomid,B_code,employeeid,remark,effective, employeemsg_extra.chinesename '
      + 'FROM Bedmsg left join employeemsg_extra on Bedmsg.employeeid=employeemsg_extra.rkey '
      + 'where bedroomid=' + IntToStr(damo.qry2.FieldValues['rkey'])+'order by B_code ';
    damo.qry3.Open;
    damo.qry3.First;

    for i := 0 to damo.qry3.RecordCount - 1 do
    begin
      PListItem := lv1.Items.Add; //增加节点

      if damo.qry3.FieldByName('chinesename').IsNull then
        PListItem.Caption := damo.qry3.FieldValues['B_code'];

      if not damo.qry3.FieldByName('chinesename').IsNull then
        PListItem.Caption := damo.qry3.FieldValues['B_code'] + '----' + damo.qry3.FieldValues['chinesename'];

      if not damo.qry3.FieldByName('employeeid').IsNull then
        PListItem.ImageIndex := 1
      else
        PListItem.ImageIndex := 2 ;
      damo.qry3.Next;
    end;
  end;
  PageControl1.ActivePageIndex := 0;
  PageControl1.OnChange(PageControl1);

  DateTimePicker2.Date := Now;
  DateTimePicker1.Date := StartOfTheYear(Now);

end;

procedure TFrmMain.tv1Click(Sender: TObject);
var
  floorStr, DormistoryStr: string;
  DormistoryRkey, DormistoryIndex, i: Integer;
  PListItem: TListItem;
begin
  if tv1.Selected=nil then exit;
  dbgrd1.DataSource.DataSet.Filtered := False;
  dbgrd1.DataSource.DataSet.filter := '';
  dbgrd1.DataSource.DataSet.Filtered := True;

  if tv1.Selected.Level =0 then
  begin
    DormistoryIndex := Pos('(', tv1.Selected.Text);
    DormistoryStr := Copy(tv1.Selected.Text,1,DormistoryIndex - 1);
    with damo.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select rkey from Dormitorymsg where D_Name = ' + QuotedStr(DormistoryStr);
      Open;
      if not FieldByName('rkey').IsNull then
      begin
        DormistoryRkey := FieldValues['rkey'];
        dbgrd1.DataSource.DataSet.filter := ' dormitoryid = ' + IntToStr(DormistoryRkey);
      end;

      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Bedmsg.rkey,bedroomid,B_code,employeeid,Bedmsg.remark,Bedmsg.effective, employeemsg_extra.chinesename '
        + 'FROM Bedmsg inner join bedroommsg on Bedmsg.bedroomid = bedroommsg.rkey '
        + 'inner join Dormitorymsg on bedroommsg.Dormitoryid=Dormitorymsg.rkey '
        + 'left join employeemsg_extra on Bedmsg.employeeid=employeemsg_extra.rkey '
        + 'where Bedmsg.effective=1 and Dormitoryid = ' + IntToStr(DormistoryRkey) + 'order by Bedmsg.rkey';
      Open;
    end;
  end;

  if tv1.Selected.Level =1 then
  begin
    floorStr := Copy(tv1.Selected.Text,3,3);
    DormistoryIndex := Pos('(', tv1.Selected.Parent.Text);
    DormistoryStr := Copy(tv1.Selected.Parent.Text, 1, DormistoryIndex - 1);
    with damo.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select rkey from Dormitorymsg where D_Name = ' + QuotedStr(DormistoryStr);
      Open;
      if not FieldByName('rkey').IsNull then
      begin
        DormistoryRkey := FieldValues['rkey'];
        dbgrd1.DataSource.DataSet.filter := ' dormitoryid = ' + IntToStr(DormistoryRkey);
      end;

      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Bedmsg.rkey,bedroomid,B_code,employeeid,Bedmsg.remark,Bedmsg.effective, employeemsg_extra.chinesename '
        + 'FROM Bedmsg inner join bedroommsg on Bedmsg.bedroomid = bedroommsg.rkey '
        + 'inner join Dormitorymsg on bedroommsg.Dormitoryid=Dormitorymsg.rkey '
        + 'left join employeemsg_extra on Bedmsg.employeeid=employeemsg_extra.rkey '
        + 'where Bedmsg.effective=1 and dormitoryid = ' + IntToStr(DormistoryRkey)
        + ' and floor = ' + floorStr + ' order by Bedmsg.rkey';
      Open;
    end;
    if dbgrd1.DataSource.DataSet.filter <> '' then
     dbgrd1.DataSource.DataSet.filter := dbgrd1.DataSource.DataSet.filter + ' and floor = ' + floorStr;
  end;

end;

procedure TFrmMain.dbgrd1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  PListItem: TListItem;
  i: Integer;
begin
  lv1.Items.Clear;
  damo.qry7.Close;
  damo.qry7.Parameters.ParamValues['BedroomRkey'] := damo.qry2.FieldValues['rkey'];
  damo.qry7.Open;  
  if not damo.qry2.FieldByName('rkey').IsNull then
  begin
    damo.qry3.Close;
    damo.qry3.SQL.Clear;
    damo.qry3.SQL.Text := 'SELECT Bedmsg.rkey,bedroomid,B_code,employeeid,remark,effective, employeemsg_extra.chinesename '
      + 'FROM Bedmsg left join employeemsg_extra on Bedmsg.employeeid=employeemsg_extra.rkey '
      + 'where bedroomid=' + IntToStr(damo.qry2.FieldValues['rkey'])+' order by B_code ';
    damo.qry3.Open;
    damo.qry3.First;

    for i := 0 to damo.qry3.RecordCount - 1 do
    begin
      PListItem := lv1.Items.Add; //增加节点

      if damo.qry3.FieldByName('chinesename').IsNull then
        PListItem.Caption := damo.qry3.FieldValues['B_code'];

      if not damo.qry3.FieldByName('chinesename').IsNull then
        PListItem.Caption := damo.qry3.FieldValues['B_code'] + '----' + damo.qry3.FieldValues['chinesename'];

      if not damo.qry3.FieldByName('employeeid').IsNull then
        PListItem.ImageIndex := 1
      else
        PListItem.ImageIndex := 2 ;
      damo.qry3.Next;
    end;
  end;
end;

procedure TFrmMain.bbt_1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if damo.qry2.FieldValues['NowBedCount'] > 0 then
  begin
    dbgrd1.Canvas.Font.Color := clRed;
    dbgrd1.Canvas.Pen.Mode:=pmMask;
  end;

  dbgrd1.Columns[2].Color := clSkyBlue;
  if gdSelected in State then 
  begin
    dbgrd1.Canvas.Brush.Color:=clYellow;
    dbgrd1.Canvas.Font.Color:=clred;
  end;
  dbgrd1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFrmMain.lv1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if lv1.Selected = nil then Exit;
  if item.ImageIndex = 1 then
  begin
    bbt_7.Enabled := True;
    bbt_5.Enabled := False;
    lb_2.Caption := '搬离日期';
  end;
  if item.ImageIndex = 2 then
  begin
    bbt_5.Enabled := True;
    bbt_7.Enabled := False;
    lb_2.Caption := '搬入日期';
  end;
end;

procedure TFrmMain.bbt_5Click(Sender: TObject);
var
  Emprkey, Bedrkey: Integer;
  BedCode, RoomCode, EmpName, IDCard: string;
begin
  if (((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) and  (Tmenuitem(Sender).Tag in [1])) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  FrmOutInInfo := TFrmOutInInfo.Create(Application);
  FrmOutInInfo.ShowModal;
  if damo.AddTag = 0 then
  begin
    Emprkey := damo.qry4.FieldValues['rkey'];
    EmpName := damo.qry4.FieldValues['chinesename'];
    IDCard  := damo.qry4.FieldValues['IDCard'];
    BedCode := lv1.Selected.Caption;
    try
      damo.con1.BeginTrans;
      with damo.qrytemp do
      begin
        //更新床位表employeeid
        SQL.Text := Format('update bedmsg set employeeid=%d where B_code=''%s'' ', [Emprkey, BedCode]);
        ExecSQL;
        //更新住宿登记表roomcode
        SQL.Text := Format('update employeemsg_extra set roomcode=''%s'' where rkey= %d ', [BedCode, Emprkey]);
        ExecSQL;
        //更新人事表roomcode
        SQL.Text := Format('update employeemsg set roomcode=''%s'' where IDCard= ''%s'' ', [BedCode, IDCard]);
        ExecSQL;
        //插入一条搬入记录
        SQL.Text := 'select rkey from bedmsg where b_code=' + QuotedStr(BedCode);
        Open;
        Bedrkey := FieldValues['rkey'];
        SQL.Text := Format('insert into Bedroomusemsg(bedid,employeeid,startdate,operator_in,oper_time_in,remark) '
          + 'values(%d,%d,''%s'',%d,''%s'',''%s'')',[Bedrkey, Emprkey, DateToStr(dtpDate.Date),
          edt_Operator.Tag, edt_OperateDate.Text,'']);
        ExecSQL;
      end;
      damo.con1.CommitTrans;
    except on e: Exception do
      begin
        damo.con1.RollbackTrans;
        ShowMessage('网络中断! (' + e.Message + ')');
      end;
    end;
    ShowMessage('员工 '+ EmpName +' 已入住成功！');
    lv1.Selected.Caption := lv1.Selected.Caption + '----' +EmpName;
    lv1.Selected.ImageIndex := 1;
    lv1.Selected.Checked := False;
    bbt_5.Enabled := False;
    bbt_7.Enabled := True;
    damo.qry2.Close;
    damo.qry2.Open;
    damo.qry7.Close;
    damo.qry7.Open;
  end;
  FrmOutInInfo.Free;
end;

procedure TFrmMain.bbt_7Click(Sender: TObject);
var
  BedCode, chinesename, IDCard: string;
  EmpRkey, BedroomusemsgRkey, Bedrkey: Integer;
begin
  if (((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) and  (Tmenuitem(Sender).Tag in [1])) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  BedCode := Copy(lv1.Selected.Caption,1,Pos('-',lv1.Selected.Caption) - 1);
  //showmessage(BedCode);
  with damo.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := Format('select rkey from bedmsg where B_code=''%s'' ', [BedCode]);
    Open;
   //showmessage(SQL.Text);
    Bedrkey := FieldValues['rkey'];
  //ShowMessage('0');
    Close;
    SQL.Clear;
    SQL.Text := 'select rkey,chinesename,IDCard from employeemsg_extra where flag <> 4 and roomcode=' + QuotedStr(BedCode);
    Open;
    EmpRkey := FieldValues['rkey'];
    IDCard := FieldValues['IDCard'];
    chinesename := FieldValues['chinesename'];
    //ShowMessage('1');
    Close;
    SQL.Clear;
    SQL.Text := 'select rkey from Bedroomusemsg where enddate is null and startdate is not null and bedid=' + IntToStr(Bedrkey);
    Open;
    if Eof
    then
    begin
    messagedlg('对不起!没有找到该员工相应有效的搬入记录',mtinformation,[mbok],0);
    Exit;
    end
    else    //ShowMessage('2');
    BedroomusemsgRkey := FieldValues['rkey'];
  end;
  if MessageDlg('确定要将员工 '+chinesename+' 离宿？'
    + #13 + '1：更新该床位为空床'
    + #13 + '2：更新人事档案中该员工房间床位号为空'
    + #13 + '3：更新住宿登记中该员工房间床位号为空'
    + #13 + '4：生成一条搬出记录', mtInformation, [mbYes, mbNo], 1) = mryes then
  begin
    try
      damo.con1.BeginTrans;
      with damo.qrytemp do
      begin
        //更新床位表employeeid
        Close;
        SQL.Clear;
        SQL.Text := Format('update bedmsg set employeeid=NULL where B_code=''%s'' ', [BedCode]);
        ExecSQL;

        //更新住宿登记表employeemsg_extra的roomcode
        Close;
        SQL.Clear;
        SQL.Text := Format('update employeemsg_extra set roomcode=NULL where rkey= %d ', [EmpRkey]);
        ExecSQL;

        //更新人事表employeemsg的roomcode
        Close;
        SQL.Clear;
        SQL.Text := Format('update employeemsg set roomcode=NULL where IDCard= ''%s'' and status=1', [IDCard]);
        ExecSQL;

        //插入一条搬出记录
        Close;
        SQL.Clear;
        SQL.Text := Format('update Bedroomusemsg set enddate=''%s'', operator_out=%d, oper_time_out=''%s'', remark=''%s'' '
          +'where rkey=%d ', [DateToStr(dtpDate.Date), edt_Operator.Tag, edt_OperateDate.Text,
          '', BedroomusemsgRkey]);
        ExecSQL;

        //更新房间表 monitor
        Close;
        SQL.Clear;
        SQL.Text := Format('update Bedroommsg set monitor=NULL where R_code=''%s'' ',[damo.qry2.FieldByName('R_code').AsString]);
        ExecSQL;
        damo.con1.CommitTrans;
        ShowMessage('员工 '+ chinesename +' 离宿成功！');
        lv1.Selected.Caption := Copy(lv1.Selected.Caption, 1, Pos('-', lv1.Selected.Caption)- 1);
        lv1.Selected.ImageIndex := 2;
        lv1.Selected.Checked := False;
        bbt_5.Enabled := True;
        bbt_7.Enabled := False;
      end;
    except on e : Exception do
      begin
        damo.con1.RollbackTrans;
        ShowMessage('网络中断！ (' + e.Message + ')');
      end;
    end;
    damo.qry2.Close;
    damo.qry2.Open;
    damo.qry7.Close;
    damo.qry7.Open;
  end;
end;

procedure TFrmMain.bbt_4Click(Sender: TObject);
begin
  FrmOnOutBedInfo := TFrmOnOutBedInfo.Create(Application);
  FrmOnOutBedInfo.ShowModal;
  FrmOnOutBedInfo.Free;
end;

procedure TFrmMain.pm_1Popup(Sender: TObject);
begin
  if lv1.Selected = nil then Exit;
  if lv1.Selected.ImageIndex = 1 then
  begin
    bbt_5.Enabled := false;
    bbt_7.Enabled := True;
    mniN1.Enabled := False;
    mniN2.Enabled := True;
  end;
  if lv1.Selected.ImageIndex = 2 then
  begin
    bbt_5.Enabled := True;
    bbt_7.Enabled := False;
    mniN1.Enabled := True;
    mniN2.Enabled := False;
  end;
end;

procedure TFrmMain.MenuItem1Click(Sender: TObject);
begin
  common.Export_dbGrid_to_Excel(dbgrd1, '房间明细');
end;

procedure TFrmMain.MenuItem3Click(Sender: TObject);
begin
  common.Export_dbGrid_to_Excel(DBGrd2, '房间人员明细');
end;

procedure TFrmmain.PageIndex;
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    edt_1.Visible := False;
    Label1.Visible := False;
    label2.Visible := False;
    Label3.Visible := False;
    DateTimePicker1.Visible := False;
    DateTimePicker2.Visible := False;
    Label4.Visible := False;
  end;
  if PageControl1.ActivePageIndex = 1 then
  begin
    Label4.Visible := True;
    field_name := dgh_grd1.Columns[0].FieldName;
    PreColumn := dgh_grd1.Columns[0];
    dgh_grd1.Columns[0].Title.Color := clred;
    Label1.Visible := True;
    label2.Visible := True;
    Label2.Caption := '搬入时间段：';
    Label3.Visible := True;
    DateTimePicker1.Visible := True;
    DateTimePicker2.Visible := True;
    if damo.qry5.Active = False then
    begin
      damo.qry5.Close;
      damo.qry5.SQL.Text := starSQL5 + ' and startdate between '
        + QuotedStr(DateToStr(DateTimePicker1.Date))
        + ' and ' + QuotedStr(DateToStr(DateTimePicker2.Date))
        + ' order by Bedroomusemsg.startdate desc ';
      damo.qry5.Open;
      label4.Caption := '当前显示记录：' + IntToStr(damo.qry5.RecordCount) + '笔';
    end;
    edt_1.Visible := True;
    edt_1.Clear;
  end;
  if PageControl1.ActivePageIndex = 2 then
  begin
    Label4.Visible := True;
    field_name := DBGridEh1.Columns[0].FieldName;
    PreColumn := DBGridEh1.Columns[0];
    DBGridEh1.Columns[0].Title.Color := clred;
    Label1.Visible := True;
    label2.Visible := True;
    Label2.Caption := '搬离时间段：';
    Label3.Visible := True;
    DateTimePicker1.Visible := True;
    DateTimePicker2.Visible := True;
    if damo.qry6.Active = False then
    begin
      damo.qry6.Close;
      damo.qry6.SQL.Text := starSQL6 + ' and enddate between '
        + QuotedStr(DateToStr(DateTimePicker1.Date))
        + ' and ' + QuotedStr(DateToStr(DateTimePicker2.Date))
        + ' order by Bedroomusemsg.enddate desc ';
      damo.qry6.Open;
      label4.Caption := '当前显示记录：' + IntToStr(damo.qry6.RecordCount) + '笔';
    end;
    edt_1.Visible := True;
    edt_1.Clear;    
  end;
end;

procedure TFrmMain.PageControl1Change(Sender: TObject);
begin
  PageIndex;
end;

procedure TFrmMain.dgh_grd1TitleClick(Column: TColumnEh);
begin
  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    damo.qry5.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    damo.qry5.Sort:=Column.FieldName+' DESC';
  end;
  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
  label1.Left := edt_1.Left - label1.Width - 5;
end;

procedure TFrmMain.edt_1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 1 then
  begin
    dgh_grd1.DataSource.DataSet.Filtered := True;
    if dgh_grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
    if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
    begin
      if trim(edt_1.text) <> '' then
        begin
          if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            begin
              dgh_grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
            end
          else
            if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            begin
              dgh_grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
            end;
        end
      else
        dgh_grd1.DataSource.DataSet.Filter:='';
    end;
    label4.Caption := '当前显示记录：' + IntToStr(dgh_grd1.DataSource.DataSet.RecordCount) + '笔';
  end;
  if PageControl1.ActivePageIndex = 2 then
  begin
    DBGridEh1.DataSource.DataSet.Filtered := True;
    if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
    if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
    begin
      if trim(edt_1.text) <> '' then
        begin
          if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            begin
              DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
            end
          else
            if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            begin
              DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
            end;
        end
      else
        DBGridEh1.DataSource.DataSet.Filter:='';
    end;
    label4.Caption := '当前显示记录：' + IntToStr(DBGridEh1.DataSource.DataSet.RecordCount) + '笔';
  end;
end;

procedure TFrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    damo.qry6.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    damo.qry6.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
  label1.Left := edt_1.Left - label1.Width - 5;
end;

procedure TFrmMain.DateTimePicker1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 1 then
  begin
    damo.qry5.Close;
    damo.qry5.SQL.Text := starSQL5 + ' and startdate between '
      + QuotedStr(DateToStr(DateTimePicker1.Date))
      + ' and ' + QuotedStr(DateToStr(DateTimePicker2.Date))
      + ' order by Bedroomusemsg.startdate desc ';
    damo.qry5.Open;
    label4.Caption := '当前显示记录：' + IntToStr(dgh_grd1.DataSource.DataSet.RecordCount) + '笔';
  end;
  if PageControl1.ActivePageIndex = 2 then
  begin
    damo.qry6.Close;
    damo.qry6.SQL.Text := starSQL6 + ' and enddate between '
      + QuotedStr(DateToStr(DateTimePicker1.Date))
      + ' and ' + QuotedStr(DateToStr(DateTimePicker2.Date))
      + ' order by Bedroomusemsg.enddate desc ';
    damo.qry6.Open;
    label4.Caption := '当前显示记录：' + IntToStr(DBGridEh1.DataSource.DataSet.RecordCount) + '笔';
  end;
end;

procedure TFrmMain.N1Click(Sender: TObject);
var
  BedCode, chinesename, IDCard: string;
  EmpRkey, BedroomusemsgRkey, Bedrkey, i: Integer;
begin
  if (strtoint(vprev) <> 4) and (strtoint(vprev) <> 2)then
  begin
    ShowMessage('对不起，您的权限不够！');
    Exit;
  end;
  i := damo.qry5.FieldByName('BedUseMsgrkey').AsInteger;
  Bedrkey := damo.qry5.FieldByName('BedRkey').AsInteger;
  EmpRkey := damo.qry5.FieldByName('Emprkey').AsInteger;
  IDCard := damo.qry5.FieldByName('IDCard').AsString;
  BedroomusemsgRkey := damo.qry5.FieldByName('BedUseMsgrkey').AsInteger;
  BedCode := damo.qry5.FieldValues['B_code'];
  chinesename := damo.qry5.FieldValues['chinesename'];
  if MessageDlg('确定要将员工 '+chinesename+' 离宿？'
    + #13 + '1：更新该床位为空床'
    + #13 + '2：更新人事档案中该员工房间床位号为空'
    + #13 + '3：更新住宿登记中该员工房间床位号为空'
    + #13 + '4：生成一条搬出记录',  mtInformation, [mbYes, mbNo], 1) = mryes then
  begin
  try
    damo.con1.BeginTrans;
    with damo.qrytemp do
    begin
      //更新床位表employeeid
      SQL.Text := Format('update bedmsg set employeeid=NULL where B_code=''%s'' ', [BedCode]);
      ExecSQL;
      //更新人事表employeemsg的roomcode
      SQL.Text := Format('update employeemsg set roomcode=NULL where IDCard= ''%s'' ', [IDCard]);
      ExecSQL;
      //更新住宿登记表roomcode
      SQL.Text := Format('update employeemsg_extra set roomcode=NULL where rkey= %d ', [EmpRkey]);
      ExecSQL;
      //插入一条搬出记录
      SQL.Text := Format('update Bedroomusemsg set enddate=''%s'', operator_out=%d, oper_time_out=''%s'', remark=''%s'' '
        +'where rkey=%d ', [DateToStr(dtpDate.Date), edt_Operator.Tag, edt_OperateDate.Text,
        '', BedroomusemsgRkey]);
      ExecSQL;
      //更新房间表 monitor
      SQL.Text := Format('update Bedroommsg set monitor=NULL where R_code=''%s'' ',[damo.qry2.FieldByName('R_code').AsString]);
      ExecSQL;
      ShowMessage('员工 '+ chinesename +' 离宿成功！');
    end;
    damo.con1.CommitTrans;
  except on e : Exception do
      begin
        damo.con1.RollbackTrans;
        ShowMessage('网络中断！ (' + e.Message + ')');
      end;
  end;

    damo.qry2.Close;
    damo.qry2.Open;
    damo.qry5.Close;
    damo.qry5.Open;
    damo.qry5.Locate('BedUseMsgrkey', i, []);
  end;
end;

procedure TFrmMain.N2Click(Sender: TObject);
var
  i: Integer;
begin
  if strtoint(vprev) <> 4 then
  begin
    ShowMessage('对不起，您的权限不够！');
    Exit;
  end;
  i := damo.qry5.FieldByName('BedUseMsgrkey').AsInteger;
  FrmIndate := TFrmIndate.Create(Application);
  FrmIndate.ShowModal;
  FrmIndate.Free;
  damo.qry5.Close;
  damo.qry5.Open;
  damo.qry5.Locate('BedUseMsgrkey', i, []);
end;

procedure TFrmMain.N3Click(Sender: TObject);
var
  i: Integer;
begin
  if strtoint(vprev) <> 4 then
  begin
    ShowMessage('对不起，您的权限不够！');
    Exit;
  end;
  i := damo.qry6.FieldByName('BedUseMsgrkey').AsInteger;
  FrmOutdate := TFrmOutdate.Create(Application);
  FrmOutdate.ShowModal;
  FrmOutdate.Free;
  damo.qry6.Close;
  damo.qry6.Open;
  damo.qry6.Locate('BedUseMsgrkey', i, []);
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 1 then
  begin
    common.Export_dbGridEH_to_Excel(dgh_grd1, '已住人员记录');
  end;
  if PageControl1.ActivePageIndex = 2 then
  begin
    common.Export_dbGridEH_to_Excel(DBGridEh1, '已住人员记录');
  end;
end;

procedure TFrmMain.lblCountWClick(Sender: TObject);
begin
  FrmWInfo := TFrmWinfo.create(application);
  FrmWInfo.ShowModal;
  FrmWInfo.Free;
end;

procedure TFrmMain.BitBtn5Click(Sender: TObject);
begin
  try
    Screen.Cursor := crhourglass;
    with damo.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'update employeemsg_extra set '
        + 'departmentname=b.departmentname,'
        + 'position=b.position_item,'
        + 'ondutytime=b.ondutytime,'
        + 'outdutytime=b.outdutytime, '
        + 'StayGrade=b.StayGrade '
        + 'from employeemsg_extra a join '
        + 'v_employeemsg b on a.employeecode=b.employeecode '
        + 'where a.employeecode in ('
        + 'select employeecode from v_employeemsg where (outdutytime is null or outdutytime>''2012-10-01'') '
        + ' )';
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Text := 'update employeemsg_extra set '
        + 'departmentname=b.departmentname,'
        + 'position=b.position_item,'
        + 'ondutytime=b.ondutytime,'
        + 'outdutytime=b.outdutytime, '
        + 'StayGrade=b.StayGrade '
        + 'from employeemsg_extra a join '
        + '[172.18.12.2].wisdompcb_wlg.dbo.v_employeemsg b on a.employeecode=b.employeecode '
        + 'where a.employeecode in ('
        + 'select employeecode from [172.18.12.2].wisdompcb_wlg.dbo.v_employeemsg where (outdutytime is null or outdutytime>''2012-10-01'') '
        + ' )';
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Text := 'update employeemsg_extra set ondutytime='
        + '(substring(ondutytime,7,4)+''-''+substring(ondutytime,1,2)+''-''+substring(ondutytime,4,2)) '
        + 'where len(ondutytime) > 10';
      ExecSQL;
      ShowMessage('人事信息与住宿信息已同步完毕....');
    end;
    Screen.Cursor := crdefault;
  except
    ShowMessage('网络异常，同步失败！');
  end;
end;

procedure TFrmMain.N7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  cur_empid,cur_bedid,cur_beduseid,des_empid,des_bedid,des_beduseid,doublechangeflag  : Integer;
  cur_employeecode :string;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    if TComponent(Sender).Tag=0 then
    begin
      InputVar.Fields := 'd_name/宿舍名称/120,r_name/房间名称/120,b_code/床编号/120,chinesename/入住员工/120,employeecode/员工编号/120,startdate/搬入日期/120';
      InputVar.Sqlstr :='select Dormitorymsg.d_name, '+
        ' bedmsg.b_code,employeemsg_extra.chinesename,employeemsg_extra.employeecode,'+
        ' bedroommsg.r_code,  ' +
        ' bedroommsg.r_name,d_floor,'   +
        ' bedmsg.employeeid,'+
        ' bedmsg.rkey as rkey,   '    +
        ' bedroomusemsg.startdate as startdate,'    +
        ' bedroomusemsg.rkey as beduseid '+
        ' from bedmsg join bedroommsg on bedmsg.bedroomid=bedroommsg.rkey  '  +
        ' join Dormitorymsg on bedroommsg.dormitoryid=Dormitorymsg.rkey     '   +      
        ' left join employeemsg_extra on bedmsg.employeeid=employeemsg_extra.rkey'+
        ' left join bedroomusemsg on bedroomusemsg.employeeid=employeemsg_extra.rkey and bedmsg.rkey=bedroomusemsg.bedid and enddate is null	';
    end;
    InputVar.AdoConn := damo.con1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      cur_employeecode := damo.qry5.fieldbyname('employeecode').AsString;
      cur_beduseid := damo.qry5.fieldbyname('bedroomuserkey').AsInteger;
      cur_empid := damo.qry5.fieldbyname('Emprkey').AsInteger;
      cur_bedid := damo.qry5.fieldbyname('BedRkey').AsInteger;
      des_bedid := frmPick_Item_Single.adsPick1.fieldbyname('rkey').AsInteger;
      if frmPick_Item_Single.adsPick1.fieldbyname('employeeid').IsNull
      then
        begin
          des_empid := 0;
          des_beduseid := 0;
          doublechangeflag := 0 ;
         end
      else
      begin
        des_empid := frmPick_Item_Single.adsPick1.fieldbyname('employeeid').AsInteger;
        des_beduseid := frmPick_Item_Single.adsPick1.fieldbyname('beduseid').AsInteger;
      end;

    damo.qry_changebed.Parameters[0].Value := edt_Operator.Tag;
    damo.qry_changebed.Parameters[1].Value := cur_empid;
    damo.qry_changebed.Parameters[2].Value := des_empid;
    damo.qry_changebed.Parameters[3].Value := cur_bedid;
    damo.qry_changebed.Parameters[4].Value := des_bedid;
    damo.qry_changebed.Parameters[5].Value := cur_beduseid;
    damo.qry_changebed.Parameters[6].Value := des_beduseid;
    damo.qry_changebed.Parameters[7].Value := formatdatetime('YYYY-MM-DD',frmPick_Item_Single.dtp1.Date);

      try
         {ShowMessage(damo.qry_changebed.SQL.Text + ','+
         inttostr(edt_Operator.Tag)+','+
         inttostr(cur_empid)+  ','+
         inttostr(des_empid)+ ','+
         inttostr(cur_bedid)+  ','+
         inttostr(des_bedid)+  ','+
         inttostr(cur_beduseid)+ ','+
         inttostr(des_beduseid) +','+
         formatdatetime('YYYY-MM-DD',frmPick_Item_Single.dtp1.Date));   }
         if (frmPick_Item_Single.dtp1.Date >= damo.qry5startdate.Value)
         and (frmPick_Item_Single.dtp1.Date >=frmPick_Item_Single.adsPick1.fieldbyname('startdate').Value)
         then
         begin
           damo.qry_changebed.ExecSQL;
           ShowMessage('更换房间成功');
         end
         else
         begin
            ShowMessage('更换房间失败，更换房间日期不能小于入住日期');
         end;
        except
          ShowMessage('未知原因，更换房间失败');
      end;  


    end;

  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
  
  damo.qry5.Close;
  damo.qry5.Open;
  damo.qry5.Locate('employeecode', cur_employeecode, []);
end;



procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin

if PageControl1.ActivePageIndex = 1 then
  begin
   damo.qry5.Close;
   damo.qry5.Open;
  end;
 if PageControl1.ActivePageIndex = 2 then
  begin
      damo.qry6.Close;
      damo.qry6.Open;
  end;
  //damo.qry6.Refresh;
end;

end.
