unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB;

type
  TGetD17Thread = class(TThread)
  private
    FQry:TADOdataset;
  protected
    procedure Execute; override;
  public
    constructor Create(Qry:TADOdataset);
  end;

  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    Grd1: TDBGridEh;
    Splitter1: TSplitter;
    Grd2: TDBGridEh;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N8: TMenuItem;
    N12: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N13: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Timer1: TTimer;
    Grd3: TDBGridEh;
    N11: TMenuItem;
    N14: TMenuItem;
    PopupMenu2: TPopupMenu;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    BitBtn5: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Timer1Timer(Sender: TObject);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure Grd2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N17Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FactGrd:TObject;
    Fsfilter,Fsfilter1,Fsfilter2,Fsfilter3,Fsfilter4,Fsfilter5,Fsfilter6,Fsfilter7:string;

    Trd:TGetD17Thread;
    procedure init;
    procedure PrcMsg(var Message: TMessage); message 6789 ;
    procedure ExportInf;
    function find_code(code:string):Boolean;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_detail_u,Frm_QrySet_u,Frm_authInfo_u,Frm_recInf_u,Frm_MatZT_u,
  Frm_report;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not App_Init_2(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end; 
  Caption := application.Title;

//  if GetServerRegion(DM.ADOCon) = '深圳' then
//  begin
//    ShowMessage('旧版本程序已经停用，请使用新版系统，请联系ERP，谢谢');
//    application.Terminate;
//  end;

 //dm.ADOCon.Open;
 //rkey73:='851';
 //user_ptr := '963';
 //vprev := '4';

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
        Fsfilter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Fsfilter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Fsfilter:='';
    CheckBox7Click(nil);
  end;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.AQ68.IsEmpty then exit;
  i := DM.AQ68rkey.AsInteger ;
  DM.AQ68.Close;
  DM.AQ68.Open;
  DM.AQ68.Locate('rkey',i,[]);
  Timer1Timer(sender);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.AQ68.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.AQ68.Sort:=Column.FieldName+' DESC';
  end;
  DM.AQ68AfterScroll(DM.AQ68);
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if field_name <> column.FieldName then
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
begin
  D17Ok:=false;
  H_mainFrm:=self.Handle;
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  Fsfilter7:='(status=7)';
  Fsfilter1:='(status=1)';

  with dm.tmp do
  begin
    close;
    sql.text:='SELECT Data0034.DEPT_CODE,Data0034.dept_name,Data0005.RKEY rkey05,data0034.pr_id '+
              'FROM Data0005 INNER JOIN '+
              'Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY INNER JOIN '+
              'Data0073 ON Data0005.RKEY = Data0073.EMPLOYEE_PTR '+
              'where data0073.rkey='+rkey73;
    open;
    dept_code := fieldvalues['dept_code'];        //人员部门
    dept_name := fieldvalues['dept_name'];
    pr_id := trim(fieldbyname('pr_id').asstring); //请购部门前缀
    rkey05 := fieldvalues['rkey05'];              //人员id
    self.Caption := dept_name+self.Caption;

   close;
   sql.Clear;
   sql.Add('select getdate() as v_dt');
   open;
   system_date := fieldvalues['v_dt'];

   sSql := dm.AQ68.SQL.Text ;
   dm.AQ68.SQL.Text:=sSql+' where  data0068.req_date>=getdate()-7 and data0068.department_name='''+
                    dept_code+''' order by po_req_number';
   dm.AQ68.Close;
   DM.AQ68.Prepared;
   dm.AQ68.Open;
   CheckBox7Click(nil);
  end;
  Trd:=TGetD17Thread.Create(DM.AQ17);
  with Trd do OnTerminate := Timer1Timer;
end;

procedure TFrm_main.Timer1Timer(Sender: TObject);
begin
  with dm.tmp do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0068 where status=4');
    sql.Add('and department_name ='''+dept_code+'''');
    open;
    label2.Visible:=not dm.tmp.IsEmpty ;
  end;
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if (dm.AQ68status.Value = 4) and (dm.AQ68data275_ptr.AsVariant <> null) then
     Grd1.Canvas.Font.Color := clred
  else if dm.AQ68status.Value = 7 then
     Grd1.Canvas.Font.Color := clTeal //cllime
  else if dm.AQ68status.Value = 4 then
     Grd1.Canvas.Font.Color := clfuchsia;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

function TFrm_main.find_code(code: string): Boolean;
var
  invNumber:string;
begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.QUAN_ON_HAND, SUM(dbo.Data0069.QUANTITY) '
                   +' AS quan_ord, ISNULL(z_t.zaitu, 0) AS zaitu, ISNULL(vmi.vmi_quantotal, 0) AS vmi_quantotal, dbo.Data0017.REPORT_VALUE2'
                   +' FROM         dbo.Data0069 INNER JOIN'
                   +' dbo.Data0017 ON dbo.Data0069.INVT_PTR = dbo.Data0017.RKEY LEFT OUTER JOIN'
                   +' (SELECT     Data0071_1.INVT_PTR, SUM(Data0071_1.QUAN_ORD - Data0071_1.QUAN_RECD) AS zaitu'
                   +' FROM   dbo.Data0071 AS Data0071_1 INNER JOIN'
                   +' dbo.Data0070 AS Data0070_1 ON Data0071_1.PO_PTR = Data0070_1.RKEY'
                   +' WHERE      (Data0070_1.STATUS = 5) AND (Data0071_1.QUAN_ORD - Data0071_1.QUAN_RECD > 0)'
                   +' GROUP BY Data0071_1.INVT_PTR) AS z_t ON dbo.Data0069.INVT_PTR = z_t.INVT_PTR LEFT OUTER JOIN'
                   +' (SELECT  TOP (100) PERCENT INVENTORY_PTR, SUM(QUAN_ON_HAND) AS vmi_quantotal'
                   +' FROM          dbo.DATA0134'
                   +' WHERE      (QUAN_ON_HAND > 0)'
                   +' GROUP BY INVENTORY_PTR) AS vmi ON dbo.Data0069.INVT_PTR = vmi.INVENTORY_PTR'
                   +' WHERE     (dbo.Data0017.REPORT_VALUE2 > 0) '
                   +' AND (dbo.Data0069.PURCH_REQ_PTR = '+code+')'
                   +' GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.QUAN_ON_HAND, dbo.Data0017.REPORT_VALUE2, '
                   +' z_t.zaitu, vmi.vmi_quantotal' 
                   +' HAVING (SUM(dbo.Data0069.QUANTITY) + dbo.Data0017.QUAN_ON_HAND + ISNULL(z_t.zaitu, 0) + ISNULL(vmi.vmi_quantotal, 0) > dbo.Data0017.REPORT_VALUE2)';
  DM.tmp.Open;
  invNumber :='';
  if DM.tmp.IsEmpty then
  begin
    Result:=False;
  end
  else
  begin
    DM.tmp.First;
    while not DM.tmp.Eof do
    begin
      if DM.tmp.RecordCount=DM.tmp.RecNo then
      begin
        invNumber := invNumber + QuotedStr(DM.tmp.FieldByName('INV_PART_NUMBER').AsString);
      end
      else
      begin
        invNumber := invNumber + QuotedStr(DM.tmp.FieldByName('INV_PART_NUMBER').AsString)+',';
      end;
      DM.tmp.Next;
    end;
    if messagedlg('你请购的物料编码 '+ invNumber+'本次请购数+在途数量+现有库存+vmi已超过最高库存,是否继续',mtconfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      Result:=False;
    end
    else
    begin
      Result :=True;
    end;

  end;
end;

procedure TFrm_main.N6Click(Sender: TObject);
var irkey68,i:integer;
    iRank,iRkey14:integer;
    isInf:boolean;
    info : string;
begin
  if (Tmenuitem(Sender).Tag in [0,1,2,8,9]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

  case Tmenuitem(Sender).Tag of
   0,1,2,3,8:
   begin
     Timer1.Enabled:=false;
     self.Visible:=not Tmenuitem(Sender).Tag in [0,1,8];
     Frm_detail:=TFrm_detail.Create(nil);
     try
       Frm_detail.Ftag:=Tmenuitem(Sender).Tag;
       Frm_detail.init;
       Frm_detail.ShowModal;
     finally
       Frm_detail.Free;
       DM.AQ69.Close;
       DM.AQ204.Close;
       self.Visible:=true;
       Timer1.Enabled:=true;
     end;
   end;
   4:try    //提交审批
       if find_code(dm.AQ68rkey.AsString)  then
       begin
         Exit;
       end;
       isInf:=messagedlg('是否短信通知审批人员?',mtconfirmation,[mbYes,mbNo],0)=mrYes;
       DM.ADOCon.BeginTrans;
       DM.tmp.Close;
       DM.tmp.SQL.Text:='update data0068 set status=1,ent_date=getdate() where rkey='+DM.AQ68rkey.AsString+' and status=7' ;
       if DM.tmp.ExecSQL=0 then
       begin
         DM.ADOCon.RollbackTrans;
         showmessage('请购单状态发生改变而未能成功提交!');
         BtBrushClick(nil);
         exit;
       end;

       DM.tmp.Close;
       DM.tmp.SQL.Text:='delete from data0276  where purchase_ptr='+DM.AQ68rkey.AsString;
       DM.tmp.ExecSQL;

       if isInf then
       begin
         DM.tmp.Close;
         DM.tmp.SQL.Text:='select * from data0014 where rkey is null';
         DM.tmp.Open;
         DM.tmp.append;
         DM.tmp.fieldvalues['MESSAGE'] := '有一张请购单需要通过您的审批,请购人员:'+
                                   dm.AQ68employee_name.Value+'请购编号:'+
                                   dm.AQ68po_req_number.Value;
         DM.tmp.fieldvalues['whosend']:= strtoint(rkey73);
         DM.tmp.post;
         iRkey14:=DM.tmp.FieldValues['rkey'];
       end;

       DM.tmp1.Close;
       DM.tmp1.SQL.Text:='select * from data0275 where AUTH_GROUP_PTR='+DM.AQ68AUTH_TYPE.AsString+' order by rkey';
       DM.tmp1.Open;
       iRank:=1;
       while not DM.tmp1.Eof do
       begin
         DM.tmp.Close;
         if iRank=1 then
           DM.tmp.SQL.Text:='insert into data0276(purchase_ptr,user_ptr,ranking,auth_flag) '+
                               'values('+DM.AQ68rkey.AsString+','+DM.tmp1.fieldbyname('user_ptr').AsString+','+
                               inttostr(iRank)+',''Y'')'
         else
           DM.tmp.SQL.Text:='insert into data0276(purchase_ptr,user_ptr,ranking,auth_flag) '+
                               'values('+DM.AQ68rkey.AsString+','+DM.tmp1.fieldbyname('user_ptr').AsString+','+
                               inttostr(iRank)+',''N'')';
         DM.tmp.ExecSQL;
         inc(iRank);
         if isInf then
         begin
           DM.tmp.SQL.Text:='insert into data0314(d14_ptr,emp_ptr) '+
                               'values('+inttostr(iRkey14)+','+DM.tmp1.fieldbyname('user_ptr').AsString+')';
           DM.tmp.ExecSQL;
         end;
         DM.tmp1.Next;
       end;
       DM.ADOCon.CommitTrans;
       BtBrushClick(nil);
     except
       DM.ADOCon.RollbackTrans;
       showmessage('数据提交出现错误,请与管理员联系!!!');
     end;
   5:try     //审核inf
       Frm_authInfo:=TFrm_authInfo.Create(nil);
       DM.tmp.Close;
       DM.tmp.SQL.Text:='SELECT Data0073.user_login_name USER_ID,Data0073.USER_FULL_NAME,data0276.user_ptr,'+
                        'data0276.auth_date,data0276.ranking,data0276.auth_flag FROM dbo.Data0073 INNER JOIN dbo.data0276 '+
                        'ON dbo.Data0073.RKEY = dbo.data0276.user_ptr '+
                        'WHERE dbo.data0276.purchase_ptr='+dm.AQ68rkey.asstring+
                        ' order by ranking';
       DM.tmp.Open;
       Frm_authInfo.DataSource1.DataSet:=DM.tmp;

       if dm.AQ68data275_ptr.AsString<>'' then
       begin
         DM.tmp1.Close;
         DM.tmp1.SQL.Text:='select employee_name from data0005 where rkey='+dm.AQ68data275_ptr.AsString;
         DM.tmp1.Open;
         Frm_authInfo.Edit1.Text:=DM.tmp1.Fields[0].AsString;
       end;
       Frm_authInfo.ShowModal;
     finally
       Frm_authInfo.Free;
     end;

   6:try
      Frm_recInf := TFrm_recInf.Create(application);
      if (dm.AQ68flag.Value = 'S') then
      begin
        Frm_recInf.DataSource1.DataSet := Frm_recInf.ADOQuery3;
        Frm_recInf.DataSource2.DataSet := Frm_recInf.ADOQuery5;
        Frm_recInf.ADOQuery3.Open;
        Frm_recInf.ADOQuery5.Open;
        if not Frm_recInf.ADOQuery3.IsEmpty then
          Frm_recInf.ShowModal
        else
          messagedlg('对不起该请购单还没有收货记录!',mtinformation,[mbok],0);
      end else begin
        Frm_recInf.DataSource1.DataSet := Frm_recInf.ADOQuery4;
        Frm_recInf.DataSource2.DataSet := Frm_recInf.ADOQuery6;
        Frm_recInf.ADOQuery4.Open;
        Frm_recInf.ADOQuery6.Open;
        if not Frm_recInf.ADOQuery4.IsEmpty then
          Frm_recInf.ShowModal
        else
          messagedlg('对不起该请购单还没有收货记录!',mtinformation,[mbok],0);
      end;
     finally
       Frm_recInf.Free;
     end;
   7:ExportInf;
   9:begin
       if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
       begin
         DM.ADOCon.BeginTrans;
         try
           DM.tmp.Close;
           DM.tmp.SQL.Text:='delete from data0068 where rkey='+DM.AQ68rkey.AsString+' and status in (7,4,5)';
           if DM.tmp.ExecSQL=0 then
           begin
             DM.ADOCon.RollbackTrans;
             showmessage('请购单状态发生改变而未能成功提交!');
             DM.AQ68.Close;
             DM.AQ68.Open;
             abort;
           end;

           DM.tmp.SQL.Text:='delete from data0011 where file_pointer='+DM.AQ68rkey.AsString+' and source_type=68';
           DM.tmp.ExecSQL;
           DM.ADOCon.CommitTrans;
           DM.AQ68.Close;
           DM.AQ68.Open;
         except
          dm.ADOCon.RollbackTrans;
          messagedlg('数据删除不成功!',mtwarning,[mbcancel],0);
         end;
       end;
     end;
  10:begin
       DM.tmp.Close;
       DM.tmp.SQL.Text:='select note_pad_line_1,note_pad_line_2,note_pad_line_3,note_pad_line_4 from data0011 where source_type=1068 and file_pointer='+DM.AQ68rkey.AsString;
       DM.tmp.Open;
       if not DM.tmp.IsEmpty then
       begin
         for i := 1 to 4 do
         begin
           if DM.tmp.FieldByName('note_pad_line_'+inttostr(i)).AsString <> '' then
             info :=  info +  DM.tmp.FieldByName('note_pad_line_'+inttostr(i)).AsString + #13;
         end;
       end;

       if dm.AQ68data275_ptr.AsVariant<>null then
       begin
         DM.tmp1.Close;
         DM.tmp1.SQL.Text:='select employee_name from data0005 where rkey='+dm.AQ68data275_ptr.AsString;
         DM.tmp1.Open;
         showmessage('该请购单在采购环节被员工:'+trim(DM.tmp1.fieldvalues['employee_name'])+'于'+#13+
                     dm.AQ68auth_date.AsString+'日退回,退回原因如下:'+#13+
                    info);
       end else
         showmessage('该请购单会签未通过原因如下：'+#13+info);
     end;
  end;
end;

procedure TFrm_main.PrcMsg(var Message: TMessage);
begin
  Grd2.Visible:=Message.WParam=0;
  Grd3.Visible:=not Grd2.Visible;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if dm.AQ68.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //检查
    n4.Enabled:=false;    //复制
    n5.Enabled:=false;    //删除
    n8.Enabled:=false;    //提交审批
    n9.Enabled:=false;    //审批信息
    n10.Enabled:=false;   //收货信息
    n13.Enabled:=false;   //导出请购项目
    n14.Enabled:=false;
  end
  else
  begin
    n2.Enabled:=dm.AQ68status.AsInteger in [7,4];
    n3.Enabled := true;
    n4.Enabled := true;
    n5.Enabled:=dm.AQ68status.AsInteger in [7,4,5];
    n8.Enabled:=dm.AQ68status.AsInteger=7;
    n9.Enabled := true;
    n10.Enabled := true;
    n13.Enabled := true;
    n14.Enabled:=dm.AQ68status.AsInteger=4;
  end;
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.ExportInf;
 var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TMemo;
   ExcelApp: Variant;
begin
  if (dm.AQ68flag.Value = 'S')  then
  begin
    Screen.Cursor := crHourglass;
    Grd2.DataSource.DataSet.DisableControls;
    bm := Grd2.DataSource.DataSet.GetBookmark;
    Grd2.DataSource.DataSet.First;

    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
    ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    mem := TMemo.Create(Self);
    mem.Visible := false;
    mem.Parent := self;
    mem.Clear;
    sline := '';

    for col := 0 to Grd1.FieldCount-1 do
      sline := sline + Grd1.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    sline := '';
    for col := 0 to Grd1.FieldCount-1 do
      sline := sline + Grd1.Fields[col].AsString + #9;
    mem.Lines.Add(sline);            //导出请购编号

    mem.Lines.Add('');//增加一行空行

    sline := '';
    for col := 0 to Grd2.FieldCount-1 do
     sline := sline + Grd2.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    for row := 0 to Grd2.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to Grd2.FieldCount-1 do
        sline := sline + Grd2.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      Grd2.DataSource.DataSet.Next;
    end;

    mem.Lines.Add('');//增加一行空行
    mem.Lines.Add('备注');//增加一行空行
    sline := '';
    with dm.ADO11 do
    begin
      dm.ADO11.Close;           //查找记事本
      dm.ADO11.Parameters[0].Value:=DM.AQ68rkey.Value;
      dm.ADO11.Open;
      if not isempty then
      for col := 1 to 4 do
       mem.Lines.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(col)).AsString);
    end;

    mem.SelectAll;
    mem.CopyToClipboard;

    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    FreeAndNil(mem);

    Grd2.DataSource.DataSet.GotoBookmark(bm);
    Grd2.DataSource.DataSet.FreeBookmark(bm);
    Grd2.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
   end
   else
   begin
    Screen.Cursor := crHourglass;
    Grd3.DataSource.DataSet.DisableControls;
    bm := Grd3.DataSource.DataSet.GetBookmark;
    Grd3.DataSource.DataSet.First;

     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    mem := TMemo.Create(Self);
    mem.Visible := false;
    mem.Parent := self;
    mem.Clear;
    sline := '';
    for col := 0 to Grd1.FieldCount-1 do
     sline := sline + Grd1.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    sline := '';
    for col := 0 to Grd1.FieldCount-1 do
     sline := sline + Grd1.Fields[col].AsString + #9;
    mem.Lines.Add(sline);            //导出请购编号
    mem.Lines.Add('');
    sline := '';
    for col := 0 to Grd3.FieldCount-1 do
     sline := sline + Grd3.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    for row := 0 to Grd3.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to Grd3.FieldCount-1 do
       sline := sline + Grd3.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      Grd3.DataSource.DataSet.Next;
    end;

    mem.Lines.Add('');
    mem.Lines.Add('备注');//增加一行空行
    sline := '';
    with dm.ADO11 do
    begin
      dm.ADO11.Close;           //查找记事本
      dm.ADO11.Parameters[0].Value:=DM.AQ68rkey.Value;
      dm.ADO11.Open;
      if not isempty then
      for col := 1 to 4 do
       mem.Lines.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(col)).AsString);
    end;

    mem.SelectAll;
    mem.CopyToClipboard;
    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    FreeAndNil(mem);

    Grd3.DataSource.DataSet.GotoBookmark(bm);
    Grd3.DataSource.DataSet.FreeBookmark(bm);
    Grd3.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

constructor TGetD17Thread.Create(Qry: TADOdataset);
begin
  FQry:=Qry;
  FreeOnTerminate := false;
  inherited Create(false);
end;

procedure TGetD17Thread.Execute;
begin
  FQry.open;
end;

procedure TFrm_main.CheckBox7Click(Sender: TObject);
var s:string;
begin
  //注意混合条件过滤的写法,与SQL 是有区别的
  if CheckBox7.Checked then Fsfilter7:=' (status=7) ' else Fsfilter7:='';
  if CheckBox1.Checked then Fsfilter1:=' (status=1) ' else Fsfilter1:='';
  if CheckBox2.Checked then Fsfilter2:=' (status=3) ' else Fsfilter2:='';
  if CheckBox3.Checked then Fsfilter3:=' (status=2) ' else Fsfilter3:='';
  if CheckBox4.Checked then Fsfilter4:=' (status=4) ' else Fsfilter4:='';
  if CheckBox5.Checked then Fsfilter5:=' (status=5) ' else Fsfilter5:='';
  if CheckBox6.Checked then Fsfilter6:=' (status=6) ' else Fsfilter6:='';
  if Fsfilter='' then
  begin
    s:='(status=99) ';
    if Fsfilter7<>'' then s:=s+'or'+Fsfilter7;
    if Fsfilter1<>'' then s:=s+'or'+Fsfilter1;
    if Fsfilter2<>'' then s:=s+'or'+Fsfilter2;
    if Fsfilter3<>'' then s:=s+'or'+Fsfilter3;
    if Fsfilter4<>'' then s:=s+'or'+Fsfilter4;
    if Fsfilter5<>'' then s:=s+'or'+Fsfilter5;
    if Fsfilter6<>'' then s:=s+'or'+Fsfilter6;
  end else begin
    if Fsfilter7<>'' then s:='('+Fsfilter+' and'+Fsfilter7+')';
    if Fsfilter1<>'' then
      if s<>'' then s:=s+' or '+'('+Fsfilter+' and'+Fsfilter1+')' else s:='('+Fsfilter+' and'+Fsfilter1+')';
    if Fsfilter2<>'' then
      if s<>'' then s:=s+' or '+'('+Fsfilter+' and'+Fsfilter2+')' else s:='('+Fsfilter+' and'+Fsfilter2+')';
    if Fsfilter3<>'' then
      if s<>'' then s:=s+' or '+'('+Fsfilter+' and'+Fsfilter3+')' else s:='('+Fsfilter+' and'+Fsfilter3+')';
    if Fsfilter4<>'' then
      if s<>'' then s:=s+' or '+'('+Fsfilter+' and'+Fsfilter4+')' else s:='('+Fsfilter+' and'+Fsfilter4+')';
    if Fsfilter5<>'' then
      if s<>'' then s:=s+' or '+'('+Fsfilter+' and'+Fsfilter5+')' else s:='('+Fsfilter+' and'+Fsfilter5+')';
    if Fsfilter6<>'' then
      if s<>'' then s:=s+' or '+'('+Fsfilter+' and'+Fsfilter6+')' else s:='('+Fsfilter+' and'+Fsfilter6+')';
  end; 
  DM.AQ68.Filter:=s;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.AQ68.SQL.Text);
end;

procedure TFrm_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Trd.Free;
end;

procedure TFrm_main.N15Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    dm.AQ68.SQL.Text:=sSql+' where data0068.req_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and data0068.req_date<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+
                           ''' and data0068.department_name='''+dept_code+''' '+Sqlstr+
                           ' order by po_req_number';
    dm.AQ68.Close;
    dm.AQ68.Prepared;
    dm.AQ68.Open;
  end;

end;

procedure TFrm_main.N16Click(Sender: TObject);
begin
  with TFrm_MatZT.Create(nil) do
  try
    ado71.Close;
    ado71.SQL.Clear;
    ado71.SQL.Text:='SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0023.ABBR_NAME, dbo.Data0071.QUAN_ORD,  '+
                   ' dbo.Data0071.QUAN_RECD, dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD AS zaitu, dbo.Data0002.UNIT_NAME, dbo.Data0071.tax_price,  '+
                   ' dbo.Data0071.TAX_2, dbo.Data0071.REQ_DATE, dbo.Data0070.PO_NUMBER, '+
                   ' ISNULL(dbo.Data0005.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS_CODE_1)  AS ANALYSIS_CODE_1,  '+
                   ' ISNULL(Data0034_1.DEPT_NAME, dbo.Data0034.DEPT_NAME) AS dept_name,   '+
                   ' ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB) AS PO_REQ_NUMBER, dbo.Data0071.reason, dbo.Data0071.rohs,  '+
                   ' dbo.Data0015.ABBR_NAME AS ComNm, Data0005_1.EMPLOYEE_NAME, dbo.Data0017.QUAN_ON_HAND, dbo.Data0069.reply_date  '+
                   ' FROM         dbo.Data0034 RIGHT OUTER JOIN dbo.Data0071 INNER JOIN '+
                   ' dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY INNER JOIN '+
                   ' dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN '+
                   ' dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+
                   'dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY INNER JOIN '+
                   'dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY INNER JOIN '+
                   'dbo.Data0005 AS Data0005_1 ON dbo.Data0070.EMPLOYEE_POINTER = Data0005_1.RKEY ON '+
                   'dbo.Data0034.DEPT_CODE = dbo.Data0070.PO_REV_NO FULL OUTER JOIN '+
                   'dbo.Data0068 LEFT OUTER JOIN '+
                   'dbo.Data0034 AS Data0034_1 ON dbo.Data0068.DEPARTMENT_NAME = Data0034_1.DEPT_CODE LEFT OUTER JOIN '+
                   'dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY FULL OUTER JOIN '+
                   'dbo.Data0069 ON dbo.Data0068.RKEY = dbo.Data0069.PURCH_REQ_PTR ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY '+
                   'WHERE     (dbo.Data0070.STATUS = 5) AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0) ' ;

    //ShowMessage(ADO71.SQL.Text);
    ADO71.Open;
    showmodal;
  finally
    free;
  end;
end;

procedure TFrm_main.Grd2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if dm.AQ69_1CRITICAL_MATL_FLAG.Value=1 then
  Grd2.Canvas.Font.Color := clRed;

  Grd2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;



procedure TFrm_main.N17Click(Sender: TObject);
begin
 try
 Form_Report:=tForm_Report.Create(application);
 Form_Report.aq0493.Close;
 Form_Report.aq0493.Open;
 Form_Report.ADO68.Close;
 Form_Report.ADO68.Parameters[0].Value:=dm.AQ68rkey.Value;
 Form_Report.ADO68.Open;
 Form_Report.ADO69.Close;
 Form_Report.ADO69.Parameters[0].Value:=dm.AQ68rkey.Value;
 Form_Report.ADO69.Parameters[1].Value:=dm.AQ68rkey.Value;
 Form_Report.ADO69.Open;
 Form_Report.ppReport1.Reset;
 Form_Report.ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'Req51.rtm';
 Form_Report.ppReport1.Template.LoadFromFile;
 Form_Report.ppReport1.SaveAsTemplate:=false;
 Form_Report.ppReport1.Print;
 finally
 Form_Report.free;
 end;
end;

procedure TFrm_main.BitBtn5Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'Req51.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

end.
