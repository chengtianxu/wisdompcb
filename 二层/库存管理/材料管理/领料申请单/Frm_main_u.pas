unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, daDataModule;

type
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
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    BitBtn6: TBitBtn;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N9: TMenuItem;
    N11: TMenuItem;
    BitBtn1: TBitBtn;
    N13: TMenuItem;
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
    procedure N6Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N11Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    result136,result137:Integer;
    procedure init;
   procedure check_exist;
   procedure check_final(control_ptr:string;quan_Bom:Single; stan_consume:Single;rkey468:string);
   procedure FillKZXM;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u,Frm_detail_u,Frm_authInfo_u,math, URep,UVMIForm;
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

{
  rkey73:= '1';
  user_ptr := '3';
  vprev := '4';
}
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
  if DM.ADO268.IsEmpty then exit;
  i := DM.ADO268rkey.AsInteger ;
  DM.ADO268.Close;
  DM.ADO268.Open;
  DM.ADO268.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO268.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO268.Sort:=Column.FieldName+' DESC';
  end;
  DM.ADO268AfterScroll(DM.ADO268);
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
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  with dm.tmp do
  begin
    close;
    sql.text:='SELECT Data0034.DEPT_CODE,Data0034.dept_name,Data0005.RKEY rkey05,Data0034.rkey,data0034.ttype,data0034.is_cost_dept '+
              'FROM Data0005 INNER JOIN '+
              'Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY INNER JOIN '+
              'Data0073 ON Data0005.RKEY = Data0073.EMPLOYEE_PTR '+
              'where data0073.rkey= '+ rkey73;
    open;
    if (fieldbyname('ttype').AsInteger=4) or (fieldbyname('ttype').AsInteger=5) or (fieldbyname('is_cost_dept').AsInteger=1) then
    begin
      dept_rkey := fieldvalues['rkey'];
      dept_code := fieldvalues['dept_code'];        //人员部门
      dept_name := fieldvalues['dept_name'];
    end;                                                          
    rkey05 := fieldvalues['rkey05'];                //人员id
  end;

  sSql:=DM.ADO268.SQL.Text;
  DM.ADO268.SQL.Text:=DM.ADO268.SQL.Text+' where dbo.DATA0268.dept_ptr = ' + IntToStr(dept_rkey) + ' and data0268.date>getdate()-1 order by number';
  DM.ADO268.Open;
  
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO268status.Value = 3 then
     Grd1.Canvas.Font.Color := clred
  else if dm.ADO268status.Value = 2 then
     Grd1.Canvas.Font.Color := clTeal //cllime
  else if dm.ADO268status.Value = 1 then
     Grd1.Canvas.Font.Color := clfuchsia
  else if dm.ADO268status.Value = 4 then
     Grd1.Canvas.Font.Color := clGreen;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if DM.ADO268.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //检查
    n4.Enabled:=false;    //提交审批
    n5.Enabled:=false;    //删除
    n6.Enabled:=false;    //prt
    n8.Enabled:=false;    //aut
    n10.Enabled:=false;    //copy
    n11.Enabled:=false;
    n9.Enabled:=false;    //cancel
  end
  else
  begin
    n2.Enabled:=(dm.ADO268status.AsInteger in [0,3])  and (Dm.ADO268EMPL_PTR.AsString=rkey05) ;
    n3.Enabled := true;
    n4.Enabled := dm.ADO268status.AsInteger=0;
    n5.Enabled:=(dm.ADO268status.AsInteger in [0,3]) and (Dm.ADO268EMPL_PTR.AsString=rkey05);
    n6.Enabled := (dm.ADO268status.AsInteger in [2,4]) and ((vprev='3') or not DM.ADO268Prted.AsBoolean);
    n8.Enabled:=true;                            //申请人员只能打印一次,仓库人员可多次打印
    n10.Enabled:=true;
    n11.Enabled := dm.ADO268allow_submit.AsInteger in [1{,3}];
    n9.Enabled:=dm.ADO268status.AsInteger in [1];
    n13.Enabled := (dm.ADO268allow_submit.AsInteger in [1{,3}]);

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
    DM.ADO268.SQL.Text:=sSql+' where data0268.date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and data0268.date-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr+
                           ' order by data0268.number';
    DM.ADO268.Close;
    DM.ADO268.Open;
  end;
end;



procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO268.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
var
  iRank: integer;
  showmessage1: string;
  Ltime: string;
  LSql: string;
  LProductAre, LUse, LTmp: Single;
  Lstan_consume: Single;
begin
  if (Tmenuitem(Sender).Tag in [0, 1, 3, 4, 10, 11]) and
    ((strtoint(vprev) = 1) or (strtoint(vprev) = 3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    abort;
  end;

  case Tmenuitem(Sender).Tag of
    0, // 新建
    1, // 编辑
    2, // 检查
    10: // 复制
      begin
        Frm_detail := TFrm_detail.Create(nil);


        dm.ADO468.First;
        if Tmenuitem(Sender).Tag <> 0 then
        begin
          while not dm.ADO468.Eof do
          begin
            FillKZXM;
            dm.ADO468.Next;
          end;
        end;
        with Frm_detail do
          try
            Ftag := Tmenuitem(Sender).Tag;
            FGrd := Grd2;
            initd;

            if Tmenuitem(Sender).Tag = 0 then
            begin
              DM.qrytmp.Close;
              dm.qrytmp.SQL.Clear;
              DM.qrytmp.SQL.Add('select abbr_name from data0073 inner join data0015 on warehouse_ptr = data0015.rkey where data0073.rkey = ' + rkey73);
              dm.qrytmp.Open;
              if not dm.qrytmp.IsEmpty then
              begin
                if Frm_detail.CBFac.Items.IndexOf(dm.qrytmp.fieldbyname('abbr_name').AsString) <> -1 then
                begin
                  Frm_detail.CBFac.ItemIndex := Frm_detail.CBFac.Items.IndexOf(dm.qrytmp.fieldbyname('abbr_name').AsString);
                  Frm_detail.CBFacChange(Frm_detail.CBFac);
                end;
              end;
            end;

            if showmodal = mrok then
            begin
              dm.ADO268.Close;
              dm.ADO268.Open;
              dm.ADO268.Locate('rkey', Frkey268, []);
            end;
          finally
            free;
            dm.ADO268_1.Close;
            dm.ADO268_1.Close;
          end;
      end;
    3: // 提交审批
      begin
        // 已确认
        if dm.ADO268allow_submit.Value < 5 then
        begin
          try
            dm.ADOCon.BeginTrans;
            dm.tmp.Close;
            dm.tmp.SQL.Text :=
              'update data0268 set status=1,auth_emplptr=null,auth_date=null where rkey='
              + dm.ADO268rkey.AsString + ' and status=0';
            if dm.tmp.ExecSQL = 0 then
            begin
              dm.ADOCon.RollbackTrans;
              showmessage('申请单状态发生改变而未能成功提交!');
              BtBrushClick(nil);
              exit;
            end;

            dm.tmp.Close;
            dm.tmp.SQL.Text := 'delete from data0368  where apply_ptr=' +
              dm.ADO268rkey.AsString;
            dm.tmp.ExecSQL;

            dm.tmp1.Close;
            dm.tmp1.SQL.Text := 'select * from data0275 where AUTH_GROUP_PTR=' +
              dm.ADO268AUTH_ptr.AsString + ' order by rkey';
            dm.tmp1.Open;
            iRank := 1;
            while not dm.tmp1.Eof do
            begin
              dm.tmp.Close;
              if iRank = 1 then
                dm.tmp.SQL.Text :=
                  'insert into data0368(apply_ptr,user_ptr,ranking,auth_flag) '
                  + 'values(' + dm.ADO268rkey.AsString + ',' +
                  dm.tmp1.fieldbyname('user_ptr').AsString + ',' +
                  inttostr(iRank) + ',''Y'')'
              else
                dm.tmp.SQL.Text :=
                  'insert into data0368(apply_ptr,user_ptr,ranking,auth_flag) '
                  + 'values(' + dm.ADO268rkey.AsString + ',' +
                  dm.tmp1.fieldbyname('user_ptr').AsString + ',' +
                  inttostr(iRank) + ',''N'')';
              dm.tmp.ExecSQL;
              inc(iRank);
              dm.tmp1.Next;
            end;
            dm.ADOCon.CommitTrans;
            BtBrushClick(nil);
          except
            dm.ADOCon.RollbackTrans;
            showmessage('数据提交出现错误,请与管理员联系!!!');
          end;
//        end else
//        // 待确认
//        if dm.ADO268allow_submit.Value = 1 then
//        begin
//          showmessage1 := '';
//          dm.qrytmp.Close;
//          dm.qrytmp.SQL.Clear;
//          dm.qrytmp.SQL.Add
//            ('SELECT group_id,stan_consume FROM data0136 WHERE RKey = ' +
//            dm.ADO268control_ptr.AsString);
//          dm.qrytmp.Open;
//          if dm.qrytmp.fieldbyname('group_id').AsInteger = 0 then
//            Ltime := '30'
//          else
//            Ltime := dm.qrytmp.fieldbyname('group_id').AsString;
//          Lstan_consume := dm.qrytmp.fieldbyname('stan_consume').AsFloat;
//
//          LSql := 'select top ' + Ltime +
//            ' * from data0137 where control_ptr = ' +
//            dm.ADO268control_ptr.AsString + ' and  warehouse_ptr = ' +
//            dm.ADO268warehouse_ptr.AsString + ' order by curr_date desc';
//          dm.ADO137.Close;
//          dm.ADO137.SQL.Text := LSql;
//          dm.ADO137.Open;
//          LProductAre := 0;
//          LUse := 0;
//          while not dm.ADO137.Eof do
//          begin
//            LProductAre := LProductAre + dm.ADO137.fieldbyname
//              ('production_area').AsFloat;
//            LUse := LUse + dm.ADO137.fieldbyname('take_out').AsFloat;
//            dm.ADO137.Next;
//          end;
//          if LUse = 0 then
//            LUse := 1;
//          LTmp := LProductAre / LUse;
//
//          // DM.ado137.Close;
//          // DM.ADO137.SQL.Text :=  'SELECT  '+#13
//          // +' sum(dbo.DATA0137.production_area) as total_area ,'+#13
//          // +' sum(dbo.DATA0137.take_out) AS total_takeout,'+#13
//          // +' case sum(dbo.DATA0137.take_out)  when 0 then 0 else'+#13
//          // +' (sum(dbo.DATA0137.production_area)/(sum(dbo.DATA0137.take_out) )) end as actual_consume '+#13
//          // +'FROM       DATA0137 '+#13
//          // +'WHERE     (dbo.DATA0137. control_ptr = '+DM.ADO268control_ptr.AsString+
//          // ' ) AND ( dbo.DATA0137.curr_date >= DATEADD(mm,   DATEDIFF(mm,0,getdate()),   0)+''08:00:00'') '+#13
//          // +' AND ( dbo.DATA0137.curr_date <=  dateadd(ms,0,DATEADD(mm,DATEDIFF(m,0,getdate())+1,0)+''08:00:00'' )) '+#13
//          // // +DM.ADO192ppc_control3.AsString+'))'+#13
//          // // +Ltime+')+''08:00:00'')'+#13
//          // +'AND (warehouse_ptr = '+DM.ADO268warehouse_ptr.AsString+' ) '+#13
//          // +'GROUP BY  dbo.DATA0137.control_ptr'+#13;
//          // DM.ado137.Open;
//
//          dm.tmp4.Close;
//          dm.tmp4.SQL.Text :=
//            'SELECT      dbo.DATA0268.rkey, dbo.Data0015.ABBR_NAME, dbo.Data0034.DEPT_NAME, '
//            + #13 + ' dbo.Data0017.INV_NAME,getdate() AS SENDTIME,dbo.Data0468.INVENT_PTR,dbo.Data0468.quan_alloc,  '
//            + #13 + ' dbo.Data0002.UNIT_NAME, dbo.DATA0136.rkey AS rkey136 , dbo.DATA0136.stan_consume , dbo.DATA0136.control_name, '
//            + #13 + ' CONVERT(varchar(10), getdate(), 120 ) AS Today1 , dbo.Data0468.quan_BOM '
//            + #13 + ' FROM         dbo.DATA0268 INNER JOIN ' + #13 +
//            ' dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Data0034.RKEY INNER JOIN '
//            + #13 + ' dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN  '
//            + #13 + ' dbo.Data0468 ON dbo.DATA0268.rkey = dbo.Data0468.FLOW_NO INNER JOIN '
//            + #13 + ' dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY INNER JOIN  '
//            + #13 + ' dbo.Data0002 ON dbo.Data0017.PURCH_UNIT_PTR = dbo.Data0002.RKEY AND    '
//            + #13 + ' dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN  '
//            + #13 + ' dbo.DATA0136 ON dbo.Data0015.RKEY = dbo.DATA0136.warehouse_ptr AND dbo.DATA0268.control_ptr = dbo.DATA0136.rkey '
//            + #13 + ' WHERE   (dbo.DATA0268.allow_submit = 1) AND ( dbo.Data0468.overproof = 1 )   '
//            + #13 + ' AND (dbo.DATA0268.rkey = ' + dm.ADO268rkey.AsString
//            + ')' + #13;
//          dm.tmp4.Open;
//          if (LTmp < Lstan_consume) and (not dm.tmp4.IsEmpty) then
//          begin
//            showmessage1 := dm.tmp4.fieldbyname('control_name').AsString +
//              ' ， ' + ' 此次领用为：' + dm.tmp4.fieldbyname('quan_BOM').AsString +
//              dm.tmp4.fieldbyname('UNIT_NAME').AsString + ' , 自今日为 ' +
//              dm.tmp4.fieldbyname('Today1').AsString + '8:00 前推 ' + Ltime  + ' 天 ' +
//              '，' + '总生产面积为：' + FloatToStr(LProductAre) + '㎡，总领用为：' +
//              FloatToStr(LUse) + dm.tmp4.fieldbyname('UNIT_NAME').AsString +
//              '， 实际产出为：' + FloatToStr(LTmp) + '㎡/' +
//              dm.tmp4.fieldbyname('UNIT_NAME').AsString + '，' + ' 产出目标为：' +
//              FloatToStr(Lstan_consume) + '㎡/' + dm.tmp4.fieldbyname
//              ('UNIT_NAME').AsString + '。';
//          end;
//          showmessage(showmessage1 + ' 您申请的物料未达到平均标准，已经无法提交，请耐心等待确认...');
//          exit;
//        end
//        else
//        // 不确认
//        begin
//          result137 := 0;
//          result136 := 0;
//          showmessage1 := '';
//          if dm.ADO268control_ptr.AsString <> '' then
//            check_exist;
//          if (result137 = 5) and (result136 = 5) then
//          begin
//            try
//              dm.ADOCon.BeginTrans;
//              dm.tmp.Close;
//              dm.tmp.SQL.Text :=
//                'update data0268 set allow_submit=1 where rkey=' +
//                dm.ADO268rkey.AsString + ' and allow_submit=0';
//              if dm.tmp.ExecSQL = 0 then
//              begin
//                dm.ADOCon.RollbackTrans;
//                showmessage('申请单状态发生改变,可能存在多人同时操作...');
//                BtBrushClick(nil);
//                exit;
//              end;
//              dm.ADOCon.CommitTrans;
//              BtBrushClick(nil);
//            except
//              dm.ADOCon.RollbackTrans;
//              showmessage('数据提交出现错误,请与管理员联系!!!');
//            end;
//            dm.qrytmp.Close;
//            dm.qrytmp.SQL.Clear;
//            dm.qrytmp.SQL.Add
//              ('SELECT group_id,stan_consume FROM data0136 WHERE RKey = ' +
//              dm.ADO268control_ptr.AsString);
//            dm.qrytmp.Open;
//            if dm.qrytmp.fieldbyname('group_id').AsInteger = 0 then
//              Ltime := '30'
//            else
//              Ltime := dm.qrytmp.fieldbyname('group_id').AsString;
//            Lstan_consume := dm.qrytmp.fieldbyname('stan_consume').AsFloat;
//
//            LSql := 'select top ' + Ltime +
//              ' * from data0137 where control_ptr = ' +
//              dm.ADO268control_ptr.AsString + ' and  warehouse_ptr = ' +
//              dm.ADO268warehouse_ptr.AsString + ' order by curr_date desc';
//            dm.ADO137.Close;
//            dm.ADO137.SQL.Text := LSql;
//            dm.ADO137.Open;
//            LProductAre := 0;
//            LUse := 0;
//            while not dm.ADO137.Eof do
//            begin
//              LProductAre := LProductAre + dm.ADO137.fieldbyname
//                ('production_area').AsFloat;
//              LUse := LUse + dm.ADO137.fieldbyname('take_out').AsFloat;
//              dm.ADO137.Next;
//            end;
//            if LUse = 0 then
//              LUse := 1;
//            LTmp := LProductAre / LUse;
//
//            // DM.ado137.Close;
//            // DM.ADO137.SQL.Text :=  'SELECT  '+#13
//            // +' sum(dbo.DATA0137.production_area) as total_area ,'+#13
//            // +' sum(dbo.DATA0137.take_out) AS total_takeout,'+#13
//            // +' case sum(dbo.DATA0137.take_out)  when 0 then 0 else'+#13
//            // +' (sum(dbo.DATA0137.production_area)/(sum(dbo.DATA0137.take_out) )) end as actual_consume '+#13
//            // +'FROM       DATA0137 '+#13
//            // +'WHERE     (dbo.DATA0137. control_ptr = '+DM.ADO268control_ptr.AsString+
//            // ' ) AND ( dbo.DATA0137.curr_date >= DATEADD(mm,   DATEDIFF(mm,0,getdate()),   0)+''08:00:00'') '+#13
//            // +' AND ( dbo.DATA0137.curr_date <=  dateadd(ms,0,DATEADD(mm,DATEDIFF(m,0,getdate())+1,0)+''08:00:00'' )) '+#13
//            // // +DM.ADO192ppc_control3.AsString+'))'+#13
//            // // +Ltime+')+''08:00:00'')'+#13
//            // +'AND (warehouse_ptr = '+DM.ADO268warehouse_ptr.AsString+' ) '+#13
//            // +'GROUP BY  dbo.DATA0137.control_ptr'+#13;
//            // DM.ado137.Open;
//
//            dm.tmp4.Close;
//            dm.tmp4.SQL.Text :=
//              'SELECT      dbo.DATA0268.rkey, dbo.Data0015.ABBR_NAME, dbo.Data0034.DEPT_NAME, '
//              + #13 + ' dbo.Data0017.INV_NAME,getdate() AS SENDTIME,dbo.Data0468.INVENT_PTR,dbo.Data0468.quan_alloc,  '
//              + #13 + ' dbo.Data0002.UNIT_NAME, dbo.DATA0136.rkey AS rkey136 , dbo.DATA0136.stan_consume , dbo.DATA0136.control_name, '
//              + #13 + ' CONVERT(varchar(10), getdate(), 120 ) AS Today1 , dbo.Data0468.quan_BOM '
//              + #13 + ' FROM         dbo.DATA0268 INNER JOIN ' + #13 +
//              ' dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Data0034.RKEY INNER JOIN '
//              + #13 + ' dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN  '
//              + #13 + ' dbo.Data0468 ON dbo.DATA0268.rkey = dbo.Data0468.FLOW_NO INNER JOIN '
//              + #13 + ' dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY INNER JOIN  '
//              + #13 + ' dbo.Data0002 ON dbo.Data0017.PURCH_UNIT_PTR = dbo.Data0002.RKEY AND    '
//              + #13 + ' dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN  '
//              + #13 + ' dbo.DATA0136 ON dbo.Data0015.RKEY = dbo.DATA0136.warehouse_ptr AND dbo.DATA0268.control_ptr = dbo.DATA0136.rkey '
//              + #13 + ' WHERE     (dbo.DATA0268.allow_submit = 1) AND ( dbo.Data0468.overproof = 1 ) '
//              + #13 + ' AND (dbo.DATA0268.rkey = ' + dm.ADO268rkey.AsString
//              + ')' + #13;
//            dm.tmp4.Open;
//            if (LTmp < Lstan_consume) and (not dm.tmp4.IsEmpty) then
//            begin
//            showmessage1 := dm.tmp4.fieldbyname('control_name').AsString +
//              ' ， ' + ' 此次领用为：' + dm.tmp4.fieldbyname('quan_BOM').AsString +
//              dm.tmp4.fieldbyname('UNIT_NAME').AsString + ' , 自今日为 ' +
//              dm.tmp4.fieldbyname('Today1').AsString + '8:00 前推 ' + Ltime  + ' 天 ' +
//              '，' + '总生产面积为：' + FloatToStr(LProductAre) + '㎡，总领用为：' +
//              FloatToStr(LUse) + dm.tmp4.fieldbyname('UNIT_NAME').AsString +
//              '， 实际产出为：' + FloatToStr(LTmp) + '㎡/' +
//              dm.tmp4.fieldbyname('UNIT_NAME').AsString + '，' + ' 产出目标为：' +
//              FloatToStr(Lstan_consume) + '㎡/' + dm.tmp4.fieldbyname
//              ('UNIT_NAME').AsString + '。';
//            end;
//            showmessage(showmessage1 +
//              ' 您申请的物料未达到平均标准，需要额外确认后方可提交，请耐心等待确认...');
//            exit;
//          end
//          else
//          begin
//            try
//              dm.ADOCon.BeginTrans;
//              dm.tmp.Close;
//              dm.tmp.SQL.Text :=
//                'update data0268 set status=1,auth_emplptr=null,auth_date=null where rkey='
//                + dm.ADO268rkey.AsString + ' and status=0';
//              if dm.tmp.ExecSQL = 0 then
//              begin
//                dm.ADOCon.RollbackTrans;
//                showmessage('申请单状态发生改变而未能成功提交!');
//                BtBrushClick(nil);
//                exit;
//              end;
//
//              dm.tmp.Close;
//              dm.tmp.SQL.Text := 'delete from data0368  where apply_ptr=' +
//                dm.ADO268rkey.AsString;
//              dm.tmp.ExecSQL;
//
//              dm.tmp1.Close;
//              dm.tmp1.SQL.Text :=
//                'select * from data0275 where AUTH_GROUP_PTR=' +
//                dm.ADO268AUTH_ptr.AsString + ' order by rkey';
//              dm.tmp1.Open;
//              iRank := 1;
//              while not dm.tmp1.Eof do
//              begin
//                dm.tmp.Close;
//                if iRank = 1 then
//                  dm.tmp.SQL.Text :=
//                    'insert into data0368(apply_ptr,user_ptr,ranking,auth_flag) '
//                    + 'values(' + dm.ADO268rkey.AsString + ',' +
//                    dm.tmp1.fieldbyname('user_ptr').AsString + ',' +
//                    inttostr(iRank) + ',''Y'')'
//                else
//                  dm.tmp.SQL.Text :=
//                    'insert into data0368(apply_ptr,user_ptr,ranking,auth_flag) '
//                    + 'values(' + dm.ADO268rkey.AsString + ',' +
//                    dm.tmp1.fieldbyname('user_ptr').AsString + ',' +
//                    inttostr(iRank) + ',''N'')';
//                dm.tmp.ExecSQL;
//                inc(iRank);
//                dm.tmp1.Next;
//              end;
//              dm.ADOCon.CommitTrans;
//              BtBrushClick(nil);
//            except
//              dm.ADOCon.RollbackTrans;
//              showmessage('数据提交出现错误,请与管理员联系!!!');
//            end;
//          end;
        end;
      end;

    4: //删除
      begin
        if MessageBox(Handle, '确定删除此申请单吗?', '提示', MB_YESNO + MB_ICONWARNING +
          MB_DEFBUTTON2) = IDNO then
          exit;
        dm.ADOCon.BeginTrans;
        try
          dm.tmp.Close;
          dm.tmp.SQL.Text := 'delete from data0468  where flow_no=' +
            dm.ADO268rkey.AsString + ' and quan_issued=0';
          if dm.tmp.ExecSQL <> dm.ADO468.RecordCount then
          begin
            dm.ADOCon.RollbackTrans;
            showmessage('删除数据失败,数据状态已发生变化...');
          end
          else
          begin
            dm.tmp.SQL.Text := 'delete from data0368  where apply_ptr=' +
              dm.ADO268rkey.AsString;
            dm.tmp.ExecSQL;
            dm.tmp.SQL.Text := 'delete from data0268 where rkey=' +
              dm.ADO268rkey.AsString + ' and status in (0,3)';
            if dm.tmp.ExecSQL = 0 then
            begin
              dm.ADOCon.RollbackTrans;
              showmessage('删除数据失败,数据状态已发生变化...');
            end
            else
              dm.ADOCon.CommitTrans;
          end;
          BtBrushClick(nil);
        except
          dm.ADOCon.RollbackTrans;
          showmessage('删除数据失败...');
        end;
      end;
    11: //取消提交
      begin
        if MessageBox(Handle, '确定取消提交此申请单吗?', '提示', MB_YESNO + MB_ICONWARNING +
          MB_DEFBUTTON2) = IDNO then
          exit;
        dm.ADOCon.BeginTrans;
        try
          dm.tmp.Close;
          dm.tmp.SQL.Text :=
            'update data0268 set status=0,auth_emplptr=null,auth_date=null where rkey = '
            + dm.ADO268rkey.AsString + ' and status=1';
          // not exists(select rkey from data0468 where flow_no='+DM.ADO268rkey.AsString+
          // ' and QUAN_ISSUED>0)';
          if dm.tmp.ExecSQL <> 1 then
          begin
            dm.ADOCon.RollbackTrans;
            showmessage('取消提交此申请单失败,数据状态已发生变化...');
          end
          else
          begin
            dm.tmp.SQL.Text := 'delete from data0368  where apply_ptr=' +
              dm.ADO268rkey.AsString;
            dm.tmp.ExecSQL;
            dm.ADOCon.CommitTrans;
          end;
          BtBrushClick(nil);
        except
          dm.ADOCon.RollbackTrans;
          showmessage('取消提交此申请单失败...');
        end;
      end;
  end;
end;


procedure TFrm_main.N6Click(Sender: TObject);
begin
   BtBrushClick(nil);
  if DM.ADO268Prted.AsBoolean and (vprev<>'3') then
  begin
    showmessage('此申请单已经打印,您无权重复打印...');
    exit;
  end;
        try
                Report_Frm:= TReport_Frm.Create(application);
                Report_Frm.ADS268.Close;
                Report_Frm.ADS268.Parameters[0].Value:=DM.ADO268rkey.Value;
                Report_Frm.ADS268.Open;
                Report_Frm.ppReport1.Reset;
                Report_Frm.ppReport1.Template.FileName :=
                  stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
                    'Rep268_1.rtm';
                Report_Frm.ppReport1.Template.LoadFromFile;
                Report_Frm.ppReport1.SaveAsTemplate:=False;
                Report_Frm.ppReport1.Print;
        finally
                Report_Frm.ADS468.Close;
                Report_Frm.ADS268.Close;
                Report_Frm.Free;
        end;
end;

procedure TFrm_main.BitBtn6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;
        try
              Report_Frm:= TReport_Frm.Create(application);
              Report_Frm.ppReport1.Reset;
              Report_Frm.ppReport1.Template.FileName :=
                stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
                  'Rep268_1.rtm';
              Report_Frm.ppReport1.Template.LoadFromFile;
              Report_Frm.ppReport1.SaveAsTemplate:=true;   
              Report_Frm.ppdesigner1.ShowModal;
        finally
              Report_Frm.ADS468.Close;
              Report_Frm.ADS268.Close;
              Report_Frm.Free;
        end;
end;


procedure TFrm_main.N8Click(Sender: TObject);
begin
   try     //审核inf
     Frm_authInfo:=TFrm_authInfo.Create(nil);
     DM.tmp.Close;
     DM.tmp.SQL.Text:='SELECT Data0073.user_login_name USER_ID,Data0073.USER_FULL_NAME,data0368.user_ptr,'+
                      'data0368.auth_date,data0368.ranking,data0368.auth_flag FROM dbo.Data0073 INNER JOIN dbo.data0368 '+
                      'ON dbo.Data0073.RKEY = dbo.data0368.user_ptr '+
                      'WHERE dbo.data0368.apply_ptr='+dm.ADO268rkey.asstring+
                      ' order by dbo.data0368.ranking';
     DM.tmp.Open;
     Frm_authInfo.DataSource1.DataSet:=DM.tmp;
     Frm_authInfo.ShowModal;
   finally
     Frm_authInfo.Free;
     DM.tmp.Close;
   end;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_main.check_exist;
begin
  DM.tmp2.Close;
  DM.tmp2.SQL.Text :=
    'select RKEY, CUT_NO, SO_NO, FLOW_NO, STEP, DEPT_PTR, INVENT_PTR,  ' + #13 +
    ' round(QUAN_BOM,2) as QUAN_BOM1, QUAN_ISSUED, STATUS, PRINTIT,  ' + #13 +
    ' VENDOR, Invent_or, quan_alloc, overproof ' + #13 +
    ' from data0468  where flow_no=' + DM.ADO268rkey.AsString;
  DM.tmp2.Open;

  while not DM.tmp2.Eof do
  begin
    DM.tmp3.Close;
    DM.tmp3.SQL.Text :=
      ' SELECT     dbo.DATA0136.rkey, dbo.DATA0136.control_name, ' + #13 +
      ' dbo.DATA0136.unit_ptr, dbo.DATA0136.warehouse_ptr, ' + #13 +
      ' dbo.DATA0136.stan_consume, dbo.DATA0155.invt_ptr ' + #13 +
      ' FROM         dbo.DATA0136 INNER JOIN   ' + #13 +
      ' dbo.DATA0155 ON dbo.DATA0136.rkey = dbo.DATA0155.control_ptr  ' + #13 +
      ' where warehouse_ptr = ' + DM.ADO268warehouse_ptr.AsString + #13 +
      ' and rkey = ' + DM.ado268control_ptr.AsString;
    DM.tmp3.Open;
    if not DM.tmp3.IsEmpty then
    begin
      result136 := 5;
      // 控制项目                  申请的数量             标准消耗                   领料单的材料
      check_final(DM.tmp3.Fields[0].AsString, DM.tmp2.Fields[7].Value,
        DM.tmp3.Fields[4].Value, DM.tmp3.Fields[5].Value);
    end;
    DM.tmp2.Next;
  end;
end;

procedure TFrm_main.check_final(control_ptr: string; quan_Bom: Single;
  stan_consume: Single; rkey468: string);
var
  compile: Single;
  Ltime: string;
  LSql: string;
  LProductAre, LUse, LTmp: Single;
begin
  dm.qrytmp.Close;
  dm.qrytmp.SQL.Clear;
  dm.qrytmp.SQL.Add('SELECT group_id FROM data0136 WHERE RKey = ' +
    control_ptr);
  dm.qrytmp.Open;
  if dm.qrytmp.FieldByName('group_id').AsInteger = 0 then
    Ltime := '30'
  else
    Ltime := dm.qrytmp.FieldByName('group_id').AsString;

  LSql := 'select top ' + Ltime + ' * from data0137 where control_ptr = ' +
    control_ptr + ' and  warehouse_ptr = ' + dm.ADO268warehouse_ptr.AsString +
    ' order by curr_date desc';
  dm.ADO137.Close;
  dm.ADO137.SQL.Text := LSql;
  dm.ADO137.Open;
  LProductAre := 0;
  LUse := 0;
  while not dm.ADO137.Eof do
  begin
    LProductAre := LProductAre + dm.ADO137.FieldByName
      ('production_area').AsFloat;
    LUse := LUse + dm.ADO137.FieldByName('take_out').AsFloat;
    dm.ADO137.Next;
  end;
  if LUse = 0 then
    LUse := 1;
  LTmp := LProductAre / LUse;
  dm.ADO192.Close;
  dm.ADO192.Open;
  // DM.ado137.Close;
  // DM.ADO137.SQL.Text :=  'SELECT  '+#13
  // +' sum(dbo.DATA0137.production_area) as total_area ,'+#13
  // +' sum(dbo.DATA0137.take_out) AS total_takeout,'+#13
  // +' case sum(dbo.DATA0137.take_out)  when 0 then 0 else'+#13
  // +' (sum(dbo.DATA0137.production_area)/(sum(dbo.DATA0137.take_out) )) end as actual_consume '+#13
  // +'FROM       DATA0137 '+#13
  // +'WHERE     (dbo.DATA0137. control_ptr = '+control_ptr+
  // ' ) AND ( dbo.DATA0137.curr_date >= DATEADD(mm,   DATEDIFF(mm,0,getdate()),   0)+''08:00:00'') '+#13
  // +' AND ( dbo.DATA0137.curr_date <=  dateadd(ms,0,DATEADD(mm,DATEDIFF(m,0,getdate())+1,0)+''08:00:00'' )) '+#13
  // // +DM.ADO192ppc_control3.AsString+'))'+#13
  // // +Ltime+')+''08:00:00'')'+#13
  // +'AND (warehouse_ptr = '+DM.ADO268warehouse_ptr.AsString+' ) '+#13
  // +'GROUP BY  dbo.DATA0137.control_ptr'+#13;
  // DM.ado137.Open;
  if not dm.ADO137.IsEmpty then
  begin
    // opValue:=(RoundTo(stan_consume,-2)) > (RoundTo(( DM.ado137.Fields[1].AsInteger / (DM.ado137.Fields[2].AsInteger + (RoundTo(quan_Bom,-2)))),-2));

    if RoundTo(LTmp, -2) > 0.05 then
    begin
      // ShowMessage(DM.ado137.Fields[2].AsString);
      // ShowMessage(FloatToStr(stan_consume));
      if RoundTo(LTmp, -2) < RoundTo(stan_consume, -2) then
      begin
        compile := RoundTo(LTmp, -2);
        // compile := RoundTo(( DM.ado137.Fields[1].Value / DM.ado137.Fields[2].Value),-2);
        if rkey468 <> '' then
        begin
          try
            dm.ADOCon.BeginTrans;
            dm.tmp.Close;
            dm.tmp.SQL.Clear;
            dm.tmp.SQL.Text :=
              'update data0468 set overproof = 1 ,quan_alloc = ' +
              FloatToStr(compile) + ' where flow_no =' + dm.ADO268rkey.AsString
              + ' AND  (overproof = 0) and ( INVENT_PTR = ' + rkey468 + ')';
            // ShowMessage(DM.tmp.SQL.Text);
            if dm.tmp.ExecSQL = 0 then
            begin
              dm.ADOCon.RollbackTrans;
              Exit;
            end;
            result137 := 5;
            dm.ADOCon.CommitTrans;
            BtBrushClick(nil);
          except
            dm.ADOCon.RollbackTrans;
            showmessage('数据提交出现错误,请与管理员联系!!!');
          end;
        end;

      end;
    end;
  end;
  dm.ADO192.Close;
end;

procedure TFrm_main.Grd2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  begin
      showmessage(DM.ADO468.SQL.Text);
  end;
end;



procedure TFrm_main.N11Click(Sender: TObject);
var
    v_message,i,j:integer;
    sms_message,sendername,phonenumber,
    StartTime,EndTime,Result1,QUAN_BOM468,number268,sendDateTime,UNIT_NAME468,showmessage1 :string;
    QueryTmp1,QueryTmp2,QueryTmp3,QueryTmp4:TADOQuery;
    rkey14 : array[0..128] of Integer;

begin
    QueryTmp1:=TADOQuery.Create(Self);
    QueryTmp1.Connection := DM.ADOCon;
    QueryTmp2:=TADOQuery.Create(Self);
    QueryTmp2.Connection := DM.ADOCon;
    QueryTmp3:=TADOQuery.Create(Self);
    QueryTmp3.Connection := DM.ADOCon;
    QueryTmp4:=TADOQuery.Create(Self);
    QueryTmp4.Connection := DM.ADOCon;

  if strtoint(vprev)<>4 then
  begin
    messagedlg('对不起!您没有允许提交的权限',mtinformation,[mbok],0);
    exit;
  end else
        if  dm.ADO268allow_submit.AsInteger=1 then
         begin

            v_message:=messagedlg('是否发送手机短信通知?',mtConfirmation,[mbyes,mbno,mbcancel],0);
            // v_message:=6;
            if v_message=6 then
            begin
                        with QueryTmp1 do
                        begin
                                Close;
                                SQL.Clear;
                                SQL.Text:=  '   SELECT     dbo.Data0073.USER_FULL_NAME, dbo.Data0005.PHONE   '+#13+
                                            ' FROM    dbo.Data0005 INNER JOIN  '+#13+
                                            '    dbo.Data0073 ON dbo.Data0005.RKEY = dbo.Data0073.EMPLOYEE_PTR AND  '+#13+
                                            '    dbo.Data0005.RKEY = dbo.Data0073.EMPLOYEE_PTR where dbo.Data0073.rkey = '+rkey73;
                                Open;
                                phonenumber := Fieldbyname('PHONE').AsString;
                                sendername := Fieldbyname('user_full_name').AsString;
                        end;
                       i :=0;

                       DM.sms1.Close;
                       dm.sms1.SQL.Clear;
                       dm.sms1.SQL.Text :=  'SELECT      dbo.DATA0268.rkey, dbo.Data0015.ABBR_NAME, dbo.Data0034.DEPT_NAME, '+#13+
                                            ' dbo.Data0017.INV_NAME,getdate() AS SENDTIME,dbo.Data0468.INVENT_PTR,dbo.Data0468.quan_alloc,  '+#13+
                                            ' dbo.Data0002.UNIT_NAME, dbo.DATA0136.rkey AS rkey136 , dbo.DATA0136.stan_consume,dbo.DATA0136.control_name, '+#13+
                                            ' month(getdate()) AS MONTH1  '+#13+
                                            ' FROM         dbo.DATA0268 INNER JOIN '+#13+
                                            ' dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Data0034.RKEY INNER JOIN '+#13+
                                            ' dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN  '+#13+
                                            ' dbo.Data0468 ON dbo.DATA0268.rkey = dbo.Data0468.FLOW_NO INNER JOIN '+#13+
                                            ' dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY INNER JOIN  '+#13+
                                            ' dbo.Data0002 ON dbo.Data0017.PURCH_UNIT_PTR = dbo.Data0002.RKEY AND    '+#13+
                                            ' dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN  '+#13+
                                            ' dbo.DATA0136 ON dbo.Data0015.RKEY = dbo.DATA0136.warehouse_ptr AND dbo.DATA0268.control_ptr = dbo.DATA0136.rkey ' +#13+
                                            ' WHERE     (dbo.DATA0268.allow_submit = 1) AND ( dbo.Data0468.overproof = 1 ) '+#13+
                                            ' AND (dbo.DATA0268.rkey = '+DM.ADO268rkey.AsString+')' +#13;
                   //   ShowMessage(dm.sms1.SQL.Text);
                      DM.sms1.Open;

                      DM.ado137.Close;
                      DM.ADO137.SQL.Text :=  'SELECT  '+#13
                                         +' sum(dbo.DATA0137.production_area) as total_area ,'+#13
                                         +' sum(dbo.DATA0137.take_out) AS total_takeout,'+#13
                                         +' case sum(dbo.DATA0137.take_out)  when 0 then 0 else'+#13
                                         +' (sum(dbo.DATA0137.production_area)/(sum(dbo.DATA0137.take_out) )) end as actual_consume '+#13
                                         +'FROM       DATA0137 '+#13
                                         +'WHERE     (dbo.DATA0137. control_ptr = '+DM.ADO268control_ptr.AsString+
                                         ' ) AND ( dbo.DATA0137.curr_date >= DATEADD(mm,   DATEDIFF(mm,0,getdate()),   0)+''08:00:00'') '+#13
                                         +' AND ( dbo.DATA0137.curr_date <=  dateadd(ms,0,DATEADD(mm,DATEDIFF(m,0,getdate())+1,0)+''08:00:00'' )) '+#13
                                         // +DM.ADO192ppc_control3.AsString+'))'+#13
                                        // +Ltime+')+''08:00:00'')'+#13
                                         +'AND (warehouse_ptr = '+DM.ADO268warehouse_ptr.AsString+' ) '+#13
                                         +'GROUP BY  dbo.DATA0137.control_ptr'+#13;
                      DM.ado137.Open;
                      if not DM.ado137.IsEmpty then
                      begin
                        showmessage1 := '共领用:'+DM.ado137.fieldbyname('total_takeout').AsString+
                        dm.sms1.fieldbyname('UNIT_NAME').AsString+',';
                      end;       {}

                      if not DM.sms1.IsEmpty then
                      begin
                          while not DM.sms1.Eof do
                          begin
                            sms_message :=  DM.sms1.Fields[1].asstring +' '+ DM.sms1.Fields[2].asstring+' '+DM.sms1.fieldByName('MONTH1').AsString+
                                            '月 共领用 '+ DM.sms1.Fields[3].asstring+DM.ado137.fieldbyname('total_takeout').AsString+dm.sms1.fieldbyname('UNIT_NAME').AsString+','+
                                            '平均产出 '+DM.sms1.Fields[6].asstring+'㎡/'+DM.sms1.Fields[7].asstring+'),未达到标准('+
                                            DM.sms1.Fields[9].asstring+'㎡/'+DM.sms1.Fields[7].asstring+'),请知悉!(ERP发送)';
                                 ShowMessage(sms_message);
                                try

                                        DM.ado14_1.Close;
                                        DM.ado14_1.Open;
                                        DM.ado14_1.Edit;
                                        DM.ado14_1.FieldByName('message').AsString:= sms_message;
                                        DM.ado14_1.FieldByName('senddate').Value := DM.sms1.Fields[4].asstring;
                                        DM.ado14_1.FieldByName('whosend').Value:= rkey73;
                                         DM.ADOCon.BeginTrans;
                                        DM.ado14_1.Post;
                                        DM.ado14_1.UpdateBatch(arAll);
                                        DM.ADOCon.CommitTrans;
                                        rkey14[i] :=DM.ado14_1.FieldByName('rkey').asinteger;
                                        Inc(i);
                                 except
                                      DM.ADOCon.RollbackTrans;
                                      showmessage('系统发生错误, 请与管理员联系!!!');
                                 end;  {}

                               DM.sms1.Next;
                          end;

                         

                            dm.sms_ToWhom.Close;
                            DM.sms_ToWhom.SQL.Clear;
                            DM.sms_ToWhom.SQL.Text := ' SELECT     dbo.DATA0139.rkey136, dbo.DATA0139.csi_ptr, dbo.Data0005.PHONE  '+#13+
                                                      '    FROM         dbo.DATA0139 INNER JOIN    '+#13+
                                                      '    dbo.DATA0136 ON dbo.DATA0139.rkey136 = dbo.DATA0136.rkey INNER JOIN    '+#13+
                                                      '    dbo.Data0073 ON dbo.DATA0139.csi_ptr = dbo.Data0073.RKEY INNER JOIN  '+#13+
                                                      '     dbo.Data0005 ON dbo.Data0073.EMPLOYEE_PTR = dbo.Data0005.RKEY AND   '+#13+
                                                      '  dbo.Data0073.EMPLOYEE_PTR = dbo.Data0005.RKEY '+#13+
                                                      'where dbo.DATA0139.rkey136 = '+DM.sms1.Fields[8].asstring;
                            dm.sms_ToWhom.Open;
                            if not DM.sms_ToWhom.IsEmpty then
                             begin
                                while not DM.sms_ToWhom.Eof do
                                begin
                                      for j:=0 to i-1 do
                                      begin
                                          try
                                            DM.ado314_1.Close;
                                            DM.ado314_1.Open;
                                            DM.ado314_1.Edit;
                                            DM.ado314_1.FieldByName('emp_ptr').AsString:= DM.sms_ToWhom.Fields[1].asstring;
                                            DM.ado314_1.FieldByName('d14_ptr').AsInteger := rkey14[j];
                                            DM.ado314_1.FieldByName('hread').Value:= 'F';
                                            DM.ado314_1.FieldByName('deleted').Value:= 'N';
                                            DM.ado314_1.FieldByName('if_note').Value:= 0;

                                             with QueryTmp2 do
                                              begin
                                                  Close;
                                                  SQL.Clear;
                                                  SQL.Text:='select SUPLFEDSHIP,SUPLFEDMAT,SUPLFEDMISC from data0192';
                                                  Open;
                                              end;
                                              if Trim(QueryTmp2.FieldByName('SUPLFEDSHIP').AsString) <> '' then
                                              begin
                                                    with QueryTmp1 do
                                                    begin
                                                          Close;
                                                          SQL.Text:='insert ['+QueryTmp2.FieldValues['SUPLFEDSHIP']+'].'+QueryTmp2.FieldValues['SUPLFEDMAT']+'.dbo.'+QueryTmp2.FieldValues['SUPLFEDMISC']+
                                                                    '(phonenumber,messagecontent,sendername,companyid) '+
                                                                    'values (:phonenumber,:messagecontent,:sendername,9)';
                                                          Parameters[0].Value:=DM.sms_ToWhom.Fields[2].asstring;
                                                          Parameters[1].Value:= sms_message;
                                                          Parameters[2].Value:=sendername;
                                                          ExecSQL;
                                                    end;
                                              end;

                                            DM.ADOCon.BeginTrans;
                                            DM.ado314_1.Post;
                                            DM.ado314_1.UpdateBatch(arAll);
                                            DM.ADOCon.CommitTrans;
                                          except
                                          DM.ADOCon.RollbackTrans;
                                          showmessage('系统发生错误, 请与管理员联系!!!');
                                          end;
                                      end;
                                  DM.sms_ToWhom.Next;
                                end;
                            end; {}
                      end else showmessage('没有可以发送短信的记录...');
                      dm.sms1.Close;
                      DM.sms_ToWhom.Close;
            end;

            try
               DM.ADOCon.BeginTrans;
               DM.tmp.Close;
               DM.tmp.SQL.Text:=' update data0268 set allow_submit=2 , allow_submit_person = '+rkey05+' , allow_submit_time = getdate() where rkey='+DM.ADO268rkey.AsString+' and allow_submit=1 '+#13+#13
                                +' update data0468 set overproof =2 , quan_alloc = 0  where flow_no = '+DM.ADO268rkey.AsString+' and overproof=1';

               if DM.tmp.ExecSQL=0 then
               begin
                 DM.ADOCon.RollbackTrans;
                 showmessage('申请单状态发生改变而未能成功确认!');
                 BtBrushClick(nil);
                 exit;
               end;
               DM.ADOCon.CommitTrans;
               DM.tmp.Close;
             except
               DM.ADOCon.RollbackTrans;
               showmessage('数据提交出现错误,请与管理员联系!!!');
             end;
        end { else  if  dm.ADO268allow_submit.AsInteger = 3 then
                  begin
                        try
                            with  QueryTmp4 do
                            begin
                               Close;
                               SQL.Text :=   '    SELECT     TOP (1) dbo.DATA0268.DATE, '+#13
                                            +'    dbo.Data0002.UNIT_NAME '+#13
                                            +'  FROM         dbo.DATA0268 INNER JOIN '+#13
                                            +'      dbo.Data0468 ON dbo.DATA0268.rkey = dbo.Data0468.FLOW_NO INNER JOIN  '+#13
                                            +'      dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY INNER JOIN  '+#13
                                            +'      dbo.Data0002 ON dbo.Data0017.PURCH_UNIT_PTR = dbo.Data0002.RKEY AND  '+#13
                                            +'      dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY  '+#13
                                            +'   WHERE     (dbo.DATA0268.control_ptr = '+dm.ADO268control_ptr.AsString+' ) AND (dbo.DATA0268.status = 2) '+#13
                                            +'  ORDER BY dbo.DATA0268.DATE DESC '+#13+#13;
                               Open;
                               if  (Trim(FieldByName('DATE').AsString) = '') or  (Trim(dm.ADO268DATE.AsString) = '') then
                               begin
                                    ShowMessage('数据读取出错，请联系管理员，谢谢！');
                                    Exit;
                                end;
                               StartTime :=  FieldByName('DATE').AsString;
                               EndTime   :=  dm.ADO268DATE.AsString;
                               UNIT_NAME468 := FieldByName('UNIT_NAME').AsString;
                            end;
                            DM.ADOCon.BeginTrans;
                            with DM.ADOProc_PreM do
                            begin
                                Close;
                                Parameters.ParamByName('@startDate').Value := StrToDateTime(StartTime);
                                parameters.ParamByName('@endDate').Value := StrToDateTime(EndTime);
                                parameters.ParamByName('@rkey136').Value := dm.ADO268control_ptr.AsInteger;
                                prepared:=true;
                                Open;
                                DM.ADOCon.CommitTrans;
                                Result1 := FormatFloat('0.00',DM.ADOProc_PreMcal_value.AsFloat);
                            end;
                            if  DM.ADOProc_PreMcal_value.AsFloat > dm.ADO468QUAN_BOM.AsFloat then
                            begin
                                  sms_message :=  DM.ADO268DEPT_NAME.AsString + ' 申领 ' + DM.ADO468INV_PART_DESCRIPTION.AsString +
                                                  ' 推论消耗为:' +Result1+' '+UNIT_NAME468+';  实际申领量为: '+dm.ADO468QUAN_BOM.AsString+
                                                  dm.ADO468unit_name.AsString + '。 少领 '+FormatFloat('0.00',(DM.ADOProc_PreMcal_value.AsFloat - dm.ADO468QUAN_BOM.AsFloat))
                                                  +dm.ADO468unit_name.AsString + '。 请相关责任人及时关注！' ;

                            end else   if  DM.ADOProc_PreMcal_value.AsFloat < dm.ADO468QUAN_BOM.AsFloat then
                            begin
                                  sms_message :=  DM.ADO268DEPT_NAME.AsString + ' 申领 ' + DM.ADO468INV_PART_DESCRIPTION.AsString +
                                              ' 推论消耗为:' +Result1+' '+UNIT_NAME468+';  实际申领量为: '+dm.ADO468QUAN_BOM.AsString+
                                              dm.ADO468unit_name.AsString + '。 多领 '+FormatFloat('0.00',(dm.ADO468QUAN_BOM.AsFloat - DM.ADOProc_PreMcal_value.AsFloat))
                                              +dm.ADO468unit_name.AsString + '。 请相关责任人及时关注！' ;
                            end else  if  DM.ADOProc_PreMcal_value.AsFloat = dm.ADO468QUAN_BOM.AsFloat then
                                  sms_message :=  DM.ADO268DEPT_NAME.AsString + ' 申领 ' + DM.ADO468INV_PART_DESCRIPTION.AsString +
                                              ' 推论消耗为:' +Result1+' '+UNIT_NAME468+';  实际申领量为: '+dm.ADO468QUAN_BOM.AsString+
                                              dm.ADO468unit_name.AsString + '。 与推算消耗相等。请相关责任人及时关注！' ;

                            DM.ADOCon.BeginTrans;
                            with DM.IM_Tmp do
                            begin
                                Close;
                                Open;
                                Append;
                                FieldByName('Corollary_Result').Value := Result1;
                                FieldByName('UNIT_NAME468').Value := UNIT_NAME468;
                                FieldByName('QUAN_BOM468').Value := dm.ADO468QUAN_BOM.Value;
                                if  DM.ADOProc_PreMcal_value.AsFloat >= dm.ADO468QUAN_BOM.AsFloat then
                                begin

                                    FieldByName('Calc_Result').Value :=  FormatFloat('0.00',(DM.ADOProc_PreMcal_value.AsFloat - dm.ADO468QUAN_BOM.AsFloat));
                                end else   if  DM.ADOProc_PreMcal_value.AsFloat < dm.ADO468QUAN_BOM.AsFloat then
                                begin
                                     FieldByName('Calc_Result').Value :=   FormatFloat('0.00',(dm.ADO468QUAN_BOM.AsFloat - DM.ADOProc_PreMcal_value.AsFloat))
                                end;
                                FieldByName('Ptr268').Value := DM.ADO268rkey.Value;
                                FieldByName('Dept_Ptr').Value := DM.ADO268dept_ptr.Value;
                                FieldByName('Control_Ptr').Value := dm.ADO268control_ptr.Value;
                                FieldByName('SMS').Value := sms_message;
                                Post;
                                UpdateBatch(arAll);
                            end;
                            DM.ADOCon.CommitTrans;
                            ShowMessage(sms_message);

                          { ShowMessage(StartTime);
                           ShowMessage(EndTime);
                           ShowMessage(sms_message);  {}

                           // v_message:= messagedlg('是否发送手机短信通知?',mtConfirmation,[mbyes,mbno,mbcancel],0);
                         {   v_message:=6;
                           if v_message=6 then
                            begin
                                        with QueryTmp1 do
                                        begin
                                                Close;
                                                SQL.Clear;
                                                SQL.Text:=  '   SELECT     dbo.Data0073.USER_FULL_NAME, dbo.Data0005.PHONE,getdate() AS SENDTIME   '+#13+
                                                            ' FROM    dbo.Data0005 INNER JOIN  '+#13+
                                                            '    dbo.Data0073 ON dbo.Data0005.RKEY = dbo.Data0073.EMPLOYEE_PTR AND  '+#13+
                                                            '    dbo.Data0005.RKEY = dbo.Data0073.EMPLOYEE_PTR where dbo.Data0073.rkey = '+rkey73;
                                                Open;
                                                phonenumber := Fieldbyname('PHONE').AsString;
                                                sendername := Fieldbyname('user_full_name').AsString;
                                                sendDateTime :=   Fieldbyname('SENDTIME').AsString;
                                        end;
                                       i :=0;
                                       DM.sms1.Close;
                                       dm.sms1.SQL.Clear;
                                       dm.sms1.SQL.Text :=  'SELECT      dbo.DATA0268.rkey, dbo.Data0015.ABBR_NAME, dbo.Data0034.DEPT_NAME, '+#13+
                                                            ' dbo.Data0017.INV_NAME,getdate() AS SENDTIME,dbo.Data0468.INVENT_PTR,dbo.Data0468.quan_alloc,  '+#13+
                                                            ' dbo.Data0002.UNIT_NAME, dbo.DATA0136.rkey AS rkey136 , dbo.DATA0136.stan_consume '+#13+
                                                            ' FROM         dbo.DATA0268 INNER JOIN '+#13+
                                                            ' dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Data0034.RKEY INNER JOIN '+#13+
                                                            ' dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN  '+#13+
                                                            ' dbo.Data0468 ON dbo.DATA0268.rkey = dbo.Data0468.FLOW_NO INNER JOIN '+#13+
                                                            ' dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY INNER JOIN  '+#13+
                                                            ' dbo.Data0002 ON dbo.Data0017.PURCH_UNIT_PTR = dbo.Data0002.RKEY AND    '+#13+
                                                            ' dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN  '+#13+
                                                            ' dbo.DATA0136 ON dbo.Data0015.RKEY = dbo.DATA0136.warehouse_ptr AND dbo.DATA0268.control_ptr = dbo.DATA0136.rkey ' +#13+
                                                             ' WHERE     (dbo.DATA0268.allow_submit = 3)'+#13+
                                                            ' AND (dbo.DATA0268.rkey = '+DM.ADO268rkey.AsString+')' +#13;
                                      //ShowMessage(dm.sms1.SQL.Text);
                                      DM.sms1.Open;     
                                      if not DM.sms1.IsEmpty then
                                      begin
                                          while not DM.sms1.Eof do
                                          begin
                                                // sms_message := DM.sms1.Fields[1].asstring +' '+ DM.sms1.Fields[2].asstring +' '+ DM.sms1.Fields[3].asstring + '平均产出 '+DM.sms1.Fields[6].asstring+'(平米/'+DM.sms1.Fields[7].asstring+'),未达到标准('+DM.sms1.Fields[9].asstring+'平米/'+DM.sms1.Fields[7].asstring+'),请知悉!(ERP自动发送)';
                                               //  ShowMessage(sms_message);
                                                 try

                                                        DM.ado14_1.Close;
                                                        DM.ado14_1.Open;
                                                        DM.ado14_1.Edit;
                                                        DM.ado14_1.FieldByName('message').AsString:= sms_message;
                                                        DM.ado14_1.FieldByName('senddate').Value := DM.sms1.Fields[4].asstring;
                                                        DM.ado14_1.FieldByName('whosend').Value:= rkey73;
                                                         DM.ADOCon.BeginTrans;
                                                        DM.ado14_1.Post;
                                                        DM.ado14_1.UpdateBatch(arAll);
                                                        DM.ADOCon.CommitTrans;
                                                        rkey14[i] :=DM.ado14_1.FieldByName('rkey').asinteger;
                                                        Inc(i);
                                                 except
                                                      DM.ADOCon.RollbackTrans;
                                                      showmessage('系统发生错误, 请与管理员联系!!!');
                                                 end;

                                               DM.sms1.Next;
                                          end;



                                            dm.sms_ToWhom.Close;
                                            DM.sms_ToWhom.SQL.Clear;
                                            DM.sms_ToWhom.SQL.Text := ' SELECT     dbo.DATA0139.rkey136, dbo.DATA0139.csi_ptr, dbo.Data0005.PHONE  '+#13+
                                                                      '    FROM         dbo.DATA0139 INNER JOIN    '+#13+
                                                                      '    dbo.DATA0136 ON dbo.DATA0139.rkey136 = dbo.DATA0136.rkey INNER JOIN    '+#13+
                                                                      '    dbo.Data0073 ON dbo.DATA0139.csi_ptr = dbo.Data0073.RKEY INNER JOIN  '+#13+
                                                                      '     dbo.Data0005 ON dbo.Data0073.EMPLOYEE_PTR = dbo.Data0005.RKEY AND   '+#13+
                                                                      '  dbo.Data0073.EMPLOYEE_PTR = dbo.Data0005.RKEY '+#13+
                                                                      'where dbo.DATA0139.rkey136 = '+DM.sms1.Fields[8].asstring;
                                            dm.sms_ToWhom.Open;
                                            if not DM.sms_ToWhom.IsEmpty then
                                             begin
                                                while not DM.sms_ToWhom.Eof do
                                                begin
                                                      for j:=0 to i-1 do
                                                      begin
                                                          try
                                                            DM.ado314_1.Close;
                                                            DM.ado314_1.Open;
                                                            DM.ado314_1.Edit;
                                                            DM.ado314_1.FieldByName('emp_ptr').AsString:= DM.sms_ToWhom.Fields[1].asstring;
                                                            DM.ado314_1.FieldByName('d14_ptr').AsInteger := rkey14[j];
                                                            DM.ado314_1.FieldByName('hread').Value:= 'F';
                                                            DM.ado314_1.FieldByName('deleted').Value:= 'N';
                                                            DM.ado314_1.FieldByName('if_note').Value:= 0;

                                                             with QueryTmp2 do
                                                              begin
                                                                  Close;
                                                                  SQL.Clear;
                                                                  SQL.Text:='select SUPLFEDSHIP,SUPLFEDMAT,SUPLFEDMISC from data0192';
                                                                  Open;
                                                              end;
                                                              if Trim(QueryTmp2.FieldByName('SUPLFEDSHIP').AsString) <> '' then
                                                              begin
                                                                    with QueryTmp1 do
                                                                    begin
                                                                          Close;
                                                                          SQL.Text:='insert ['+QueryTmp2.FieldValues['SUPLFEDSHIP']+'].'
                                                                                    +QueryTmp2.FieldValues['SUPLFEDMAT']+'.dbo.'+QueryTmp2.FieldValues['SUPLFEDMISC']+
                                                                                    '(phonenumber,messagecontent,sendername,companyid) '+
                                                                                    'values (:phonenumber,:messagecontent,:sendername,9)';
                                                                          Parameters[0].Value:=DM.sms_ToWhom.Fields[2].asstring;
                                                                          Parameters[1].Value:= sms_message;
                                                                          Parameters[2].Value:=sendername;
                                                                          ExecSQL;
                                                                    end;
                                                              end;

                                                            DM.ADOCon.BeginTrans;
                                                            DM.ado314_1.Post;
                                                            DM.ado314_1.UpdateBatch(arAll);
                                                            DM.ADOCon.CommitTrans;
                                                          except
                                                              DM.ADOCon.RollbackTrans;
                                                              showmessage('系统发生错误, 请与管理员联系!!!');
                                                          end;
                                                      end;
                                                  DM.sms_ToWhom.Next;
                                                end;
                                            end;
                                      end else showmessage('没有可以发送短信的记录...');
                                      dm.sms1.Close;
                                      DM.sms_ToWhom.Close;
                            end;


                               DM.ADOCon.BeginTrans;
                               DM.tmp.Close;
                               DM.tmp.SQL.Text:=' update data0268 set allow_submit=2 , allow_submit_person = '+rkey05+' , allow_submit_time = getdate() where rkey='+DM.ADO268rkey.AsString+' and allow_submit=3 '+#13+#13
                                                +' update data0468 set overproof =2 , quan_alloc = 0  where flow_no = '+DM.ADO268rkey.AsString;

                               if DM.tmp.ExecSQL=0 then
                               begin
                                 DM.ADOCon.RollbackTrans;
                                 showmessage('申请单状态发生改变而未能成功确认!');
                                 BtBrushClick(nil);
                                 exit;
                               end;
                               DM.ADOCon.CommitTrans;
                               DM.tmp.Close;   

//                                Imp_Met_Detail := TImp_Met_Detail.Create(nil);
//                                Imp_Met_Detail
                        except
                          on   e:   EConvertError   do
                          begin
                            ShowMessage(e.Message);
                            DM.ADOCon.RollbackTrans;
                          end;
                        end;
                  end {}

        else begin
             showmessage('确认状态不正确，无法确认...');
             Exit;
        end;
    BtBrushClick(nil);
end;

procedure TFrm_main.btn1Click(Sender: TObject);
begin
   // ShowMessage(DM.ADO268rkey.AsString);
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
 with TVMIForm.Create(nil) do
 try
         if showmodal=mrok then
         begin
          // DM.ADO268.Close;
          // DM.ADO268.Open;
           //DM.ADO268.Locate('rkey',Frkey268,[]);
         end;
 finally
         free;
        // DM.ADO268_1.Close;
        // DM.ADO268_1.Close;
 end;
end;

procedure TFrm_main.N13Click(Sender: TObject);
begin
        if  dm.ADO268allow_submit.AsInteger<>1 then
        begin
             showmessage('确认状态不正确，无法确认...');
             Exit;
        end else begin

            try
               DM.ADOCon.BeginTrans;
               DM.tmp.Close;
               DM.tmp.SQL.Text:=' update data0268 set allow_submit=2 , allow_submit_person = '+rkey05+' , allow_submit_time = getdate() where rkey='+DM.ADO268rkey.AsString+' and allow_submit=1 '+#13+#13
                                +' update data0468 set overproof =2 , quan_alloc = 0  where flow_no = '+DM.ADO268rkey.AsString+' and overproof=1';

               if DM.tmp.ExecSQL=0 then
               begin
                 DM.ADOCon.RollbackTrans;
                 showmessage('申请单状态发生改变而未能成功确认!');
                 BtBrushClick(nil);
                 exit;
               end;
               DM.ADOCon.CommitTrans;
               DM.tmp.Close;
             except
               DM.ADOCon.RollbackTrans;
               showmessage('数据提交出现错误,请与管理员联系!!!');
             end;
        end;
    BtBrushClick(nil);
end;

procedure TFrm_main.FillKZXM;
var
  LS: TStringList;
  I: Integer;
  tmpIndex: Integer;
begin
  DM.adsKZXM.Close;
  DM.adsKZXM.Parameters.ParamByName('PRKey17').Value := dm.ADO468.fieldbyname('INVENT_PTR').AsInteger;
  DM.adsKZXM.Parameters.ParamByName('PRKey15').Value := dm.ADO268.fieldbyname('warehouse_ptr').AsInteger;
  DM.adsKZXM.Parameters.ParamByName('PRKey34').Value := DM.ADO268.fieldbyname('dept_ptr').AsInteger;
  DM.adsKZXM.Open;
  if DM.adsKZXM.IsEmpty then Exit;
  if Frm_detail.cbbKZXM.Items.Count = 0 then
  begin
    while not DM.adsKZXM.Eof do
    begin
      Frm_detail.cbbKZXM.AddItem(DM.adsKZXM.fieldbyname('control_name').AsString,Pointer(DM.adsKZXM.fieldbyname('RKey').asInteger));
      DM.adsKZXM.Next;
    end;
    Frm_detail.cbbKZXM.ItemIndex := 0;
  end else
  begin
    LS := TStringList.Create;
    try
    while not DM.adsKZXM.Eof do
    begin
      for I := 0 to Frm_detail.cbbKZXM.Items.Count - 1 do
      begin
        if Integer(Frm_detail.cbbKZXM.Items.Objects[I]) = DM.adsKZXM.fieldbyname('RKey').asInteger then
        begin
          LS.AddObject(Frm_detail.cbbKZXM.Items[I],Frm_detail.cbbKZXM.Items.Objects[I]);
        end;
      end;
      DM.adsKZXM.Next;
    end;
    if LS.Count = 0 then
    begin
      //ShowMessage('一张配料单中不能有2种不同控制项目的材料');
      Frm_detail.cbbKZXM.Items.Clear;
    end else
    begin
      tmpIndex := Frm_detail.cbbKZXM.ItemIndex;
      Frm_detail.cbbKZXM.Items.Clear;
      Frm_detail.cbbKZXM.Items.Assign(LS);
      if Frm_detail.cbbKZXM.Items.Count -1 >= tmpIndex then
      begin
        Frm_detail.cbbKZXM.ItemIndex := tmpIndex;
      end else
        Frm_detail.cbbKZXM.ItemIndex := 0;
    end;
    finally
      LS.Free;
    end;
  end;
end;

end.
