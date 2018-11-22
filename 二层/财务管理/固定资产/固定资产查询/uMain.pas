unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, DBGridEh, Menus,uFFass,
  ExtCtrls, Excel2000,ClipBrd,ComObj,math, ComCtrls;

type
  TFmain = class(TForm)
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    DBGridEh1: TDBGridEh;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    pm1: TPopupMenu;
    btn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);

    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure Edit2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pm1Popup(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
   _FN:string;
   sSql:string;
   function SetValFass(var pConstr:TFrmFass):boolean; //给固定资产赋值
   function SetOrigVal(var pConstr1,pConstr2:TStringGrid;const prkey:integer):boolean; //原值赋值
   function SetDeprVal(var pConstr1,pConstr2:TStringGrid;const prkey:integer):boolean; //折旧费用分滩
   function GetDepAlter(const prkey:string):string;
   procedure SetDep();
   procedure DoSearch(subSql:string);
   procedure RefreshData(rKey:integer);//刷新数据
   procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Fmain: TFmain;

implementation

uses uMD, DateUtils,common,QuerySet;

{$R *.dfm}

procedure TFmain.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.Conn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;

//  user_ptr:='4';
//  vprev:='4';
//  dm.Conn.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  sSql:=DM.Qery517.CommandText;
end;

procedure TFmain.SetDep();
var
 vsql:string;
begin
  dm.Qery517.First;
  dm.Qery517.DisableControls ;
  while not  dm.Qery517.Eof do
   begin
    vsql:=GetDepAlter(dm.Qery517.FieldByName('rkey').asstring);
    if  vsql<>'' then
     begin
      dm.Qery.Close;
      dm.Qery.SQL.Clear;
      dm.Qery.SQL.Text :=vsql;
      dm.Qery.Open;

      dm.Qery517.Edit;
      dm.Qery517.FieldByName('DEPT_NAME').Value :=dm.Qery.FieldByName('DEPT_NAME').Value;
     end;

    dm.Qery517.Next;
   end;

   dm.Qery517.EnableControls;    
end;
function TFmain.GetDepAlter(const prkey:string):string;
var
 vsql:string;
begin
   vsql:='select top 1 * from data0327 ';
   vsql:= vsql+' where ';
   vsql:= vsql+' fasset_ptr='+prkey;
   vsql:= vsql+' and ';
   vsql:= vsql+' alter_type=3';
   vsql:= vsql+' ORDER BY RKEY DESC ';
   dm.Qery.close;
   dm.Qery.SQL.Clear;
   dm.Qery.SQL.Text:=vsql;
   dm.Qery.Open;
   if dm.Qery.RecordCount>0 then
    begin
     vsql:='SELECT data0326.*, Data0034.DEPT_CODE, Data0034.DEPT_NAME,';
     vsql:=vsql+' Data0103.GL_ACC_NUMBER, Data0103.GL_DESCRIPTION';
     vsql:=vsql+' FROM data0326 INNER JOIN ';
     vsql:=vsql+' Data0034 ON data0326.dept_ptr = Data0034.RKEY INNER JOIN';
     vsql:=vsql+' Data0103 ON data0326.FACCU_DEPT_GL_PTR = Data0103.RKEY';
     vsql:=vsql+' where data0326.d327_ptr='+dm.Qery.fieldbyname('rkey').AsString;
     result:=vsql;
    end
   else
    result:='';
end;
//原值赋值
function TFmain.SetOrigVal(var pConstr1,pConstr2:TStringGrid;const prkey:integer):boolean; //给固定资产赋值
var
  vsql:string;
  vcur:currency;
begin
  dm.Qery.Close ;
  dm.Qery.SQL.Clear ;
  vsql:='SELECT data0325.*, Data0001.CURR_CODE, Data0001.CURR_NAME';
  vsql:=vsql+' FROM data0325 INNER JOIN';
  vsql:=vsql+' Data0001 ON data0325.curr_ptr = Data0001.RKEY';
  vsql:=vsql+' where data0325.fasset_ptr='+inttostr(prkey);
  dm.Qery.SQL.Text :=vsql;
  dm.Qery.Open ;
  pConstr1.RowCount:=pConstr1.RowCount+1;
  pConstr1.Cells[0,pConstr1.RowCount-2]:=dm.Qery.FieldByName('CURR_NAME').value;    //币种
  pConstr1.Cells[1,pConstr1.RowCount-2]:=dm.Qery.FieldByName('ex_rate').AsString;        //汇率
  pConstr1.Cells[2,pConstr1.RowCount-2]:=dm.Qery.FieldByName('orig_curr_orig_value').AsString ;       //原币
  vcur:=dm.Qery.FieldByName('orig_curr_orig_value').Value ;
  vcur:=vcur/dm.Qery.FieldByName('ex_rate').Value ;
  pConstr1.Cells[3,pConstr1.RowCount-2]:=floattostr(vcur);        //本币

  pConstr2.RowCount:=pConstr1.RowCount+1;
  pConstr2.Cells[0,pConstr1.RowCount-2]:=inttostr(dm.Qery.FieldByName('curr_ptr').Value);    //币种指针
  result:=true;
end;

//折旧费用赋值
function TFmain.SetDeprVal(var pConstr1,pConstr2:TStringGrid;const prkey:integer):boolean;
var
  vsql:string;
begin
  dm.Qery.Close ;
  dm.Qery.SQL.Clear ;
  if vsql='' then
   begin
    vsql:='SELECT data0326.*, Data0034.DEPT_CODE, Data0034.DEPT_NAME,';
    vsql:=vsql+' Data0103.GL_ACC_NUMBER, CASE WHEN NOT (Data0103_2.GL_DESCRIPTION IS NULL) AND';
    vsql:=vsql+' NOT (Data0103_1.GL_DESCRIPTION IS NULL)';
    vsql:=vsql+' THEN Data0103_2.GL_DESCRIPTION + '+''''+'-'+'''' + '+Data0103_1.GL_DESCRIPTION+'+''''+ '-'+''''+ '+Data0103.GL_DESCRIPTION';
    vsql:=vsql+' WHEN NOT (Data0103_1.GL_DESCRIPTION IS NULL)';
    vsql:=vsql+' THEN Data0103_1.GL_DESCRIPTION+' +''''+ '-'+'''' + '+Data0103.GL_DESCRIPTION ELSE Data0103.GL_DESCRIPTION';
    vsql:=vsql+' END AS GL_DESCRIPTION';
    vsql:=vsql+' FROM Data0103 Data0103_2 RIGHT OUTER JOIN';
    vsql:=vsql+' Data0103 Data0103_1 ON';
    vsql:=vsql+' Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN ';
    vsql:=vsql+' data0326 INNER JOIN ';
    vsql:=vsql+' Data0034 ON data0326.dept_ptr = Data0034.RKEY INNER JOIN ';
    vsql:=vsql+' Data0103 ON data0326.FACCU_DEPT_GL_PTR = Data0103.RKEY ON ';
    vsql:=vsql+' Data0103_1.RKEY = Data0103.PARENT_PTR ';
    vsql:=vsql+' where data0326.fasset_ptr='+inttostr(prkey);

   end; 
  
  dm.Qery.SQL.Text :=vsql;
  dm.Qery.Open ;
  pConstr1.RowCount:=pConstr1.RowCount+1;
  pConstr1.Cells[0,pConstr1.RowCount-2]:=dm.Qery.FieldByName('DEPT_NAME').value;    //部门名称
  pConstr1.Cells[1,pConstr1.RowCount-2]:=dm.Qery.FieldByName('PERCENTS').AsString;        //百分比
  pConstr1.Cells[2,pConstr1.RowCount-2]:=dm.Qery.FieldByName('GL_ACC_NUMBER').value ;  //科目代码
  pConstr1.Cells[3,pConstr1.RowCount-2]:=dm.Qery.FieldByName('GL_DESCRIPTION').value ; //科目名称

  pConstr2.RowCount:=pConstr1.RowCount+1;
  pConstr2.Cells[0,pConstr1.RowCount-2]:=dm.Qery.FieldByName('DEPT_CODE').Value;    //部门代码
  pConstr2.Cells[1,pConstr1.RowCount-2]:=dm.Qery.FieldByName('dept_ptr').asstring;    //部门指针
  pConstr2.Cells[2,pConstr1.RowCount-2]:=dm.Qery.FieldByName('FACCU_DEPT_GL_PTR').asstring;    //科目指针
  result:=true; 
end;
//给固定资产赋值
function TFmain.SetValFass(var pConstr:TFrmFass):boolean;
begin
  dm.DS517.Close ;
  dm.DS517.CommandText :='select * from data0517 where rkey='+dm.Qery517.fieldbyname('rkey').AsString ;
  dm.DS517.Open ;

  pConstr.edit13.Text:=dm.DS517.FieldByName('FASSET_CODE').AsString;        //ID号
  pConstr.edit15.Text:=dm.DS517.FieldByName('FASSET_NAME').AsString;        //名称
  pConstr.edit18.Text:=dm.DS517.FieldByName('FASSET_DESC').AsString;        //规格
  pConstr._FasTpkey:=dm.DS517.FieldByName('FASSET_TYPE_PTR').Value;          //类别
  pConstr._FasAltkey:=dm.DS517.FieldByName('ALT_TYPE_PTR').Value;            //增减方式
  pConstr._FasStatkey:=dm.DS517.FieldByName('STATUS_PTR').Value;             //使用状态
  pConstr.edit3.Text:=dm.DS517.FieldByName('original_value').asstring;       //当前原值
  SetOrigVal(pConstr.StrGrdOrig1,pConstr.StrGrdOrig2,dm.DS517.FieldByName('rkey').Value);

  pConstr.edit1.Text:=dm.DS517.FieldByName('LOCATION').AsString;             //位置
  pConstr.datetimepicker1.date:= dm.Qery517.FieldByName('BOOK_DATE').AsDateTime ; //入帐日期
  pConstr.edit7.Text:=dm.DS517.FieldByName('SURPLUS_RATE').AsString;         //预计净残值率(%)
  pConstr.edit8.Text:=dm.DS517.FieldByName('SURPLUS').AsString;              //预计净残值
  pConstr.combobox2.ItemIndex:=dm.DS517.FieldByName('DEPRE_MTHD_PTR').Value; //固定资产折旧方法(012345)
  pConstr.edit9.Text:=dm.DS517.FieldByName('EXPECTED_LIFE_MONTHS').Value;    //预计使用月份
  pConstr.SpinEdit1.Value:=dm.DS517.FieldByName('DEPRED_MONTHS').Value;    //已计提月份

  pConstr.edit4.Text:=dm.DS517.FieldByName('SUMMED_DEPRE').AsString;       //累计折旧额

  pConstr.edit5.Text:=dm.DS517.FieldByName('NET_VALUE').AsString;          //净值
  if dm.DS517.FieldByName('LOADING_UNIT').AsVariant <>null then
    pConstr.edit2.Text:=dm.DS517.FieldByName('LOADING_UNIT').Value ;         //工作量单位
  pConstr.edit11.Text:=dm.DS517.FieldByName('MONTH_DEPRE_RATE').AsString;    //月折旧率
  pConstr.edit12.Text:=dm.DS517.FieldByName('MONTH_DEPRE_AMT').AsString;     //月折旧额
  pConstr._FasDepAckey:=dm.DS517.FieldByName('DEPRE_ACCT_PTR').Value;        //累计折旧科目指针103
  pConstr._FasGlkey:=dm.DS517.FieldByName('fasset_gl_ptr').Value;            //固产会计科目指针0103
  pConstr.edit14.Text:=dm.DS517.FieldByName('id_code').Value;                //固定资产编号
  if dm.DS517.FieldByName('REMARK').AsVariant <>null then
   pConstr.Memo1.Text:=dm.DS517.FieldByName('REMARK').Value;                 //备注
  SetDeprVal(pConstr.StrGrd,pConstr.StrGrd1,dm.DS517.FieldByName('rkey').Value);// 折旧费用

  result:=true;
end;

procedure TFmain.FormShow(Sender: TObject);
begin

if  dm.Conn.Connected then
 begin
  dm.ads0514.Close;
  dm.ads0514.open;
  dm.ads0516.Close;
  dm.ads0516.Open;
  DM.qryAcctItem.Open;
  DateTimePicker1.Date := date;
 end;
end;

procedure TFmain.FormActivate(Sender: TObject);
begin
try
 dm.Qery517.Close ;
 dm.Qery517.open;
 StatusBar1.Panels[1].Text := IntToStr(dm.Qery517.RecordCount);
 _FN:='id_code';
 DBGridEh1TitleClick(DBGridEh1.Columns[0]);
 except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;

//排序
procedure TFmain.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.Qery517.IndexFieldNames:=Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   dm.Qery517.IndexFieldNames:=Column.FieldName+' DESC';
  end;
 if column.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
  abort;
 //查找
 _FN:=Column.FieldName;
 label1.Caption:=column.Title.Caption+'：';
 case Column.Field.DataType  of
  ftDateTime:
   begin
    DateTimePicker1.Visible :=true;
    edit1.Visible :=not DateTimePicker1.Visible;
    edit2.Visible:=not DateTimePicker1.Visible;
   end;
  ftAutoInc,ftInteger,ftSmallInt:
   begin
    edit2.Visible:=true;
    DateTimePicker1.Visible :=not edit2.Visible;
    edit1.Visible:=not edit2.Visible;
   end;
 ftString:
  begin
   edit1.Visible :=true;
   edit2.Visible :=not edit1.Visible;
   DateTimePicker1.Visible:=not edit1.Visible;
  end;

 end;
 DateTimePicker1.Left :=edit1.Left;
 DateTimePicker1.Top:=edit1.Top;
 edit2.Top:=edit1.Top;
 edit2.Left :=edit1.Left ;
end;
//导出EXCEL
procedure TFmain.SpeedButton4Click(Sender: TObject);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
   try
     XLApp := CreateOleObject('Excel.Application');
   except
     Screen.Cursor := crDefault;
     Exit;
   end;
   XLApp.WorkBooks.Add;
   XLApp.SheetsInNewWorkbook := 1;
   XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrideh(self.DBGrideh1).DataSource.DataSet.Active then
     begin
      Screen.Cursor := crDefault;
      Exit;
     end;
   TDBGrideh(DBGrideh1).DataSource.DataSet.DisableControls;
   TDBGrideh(DBGrideh1).DataSource.DataSet.first;
   v_cloumn:=TDBGrideh(DBGrideh1).Columns.Count;
   v_cloumn:=Floor(v_cloumn/2);

   Sheet.Cells[1, v_cloumn] :='；固定资产一览表';

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;
                                      
   Sheet.Cells[2, v_cloumn+1] :='导出时间:'+DateTimeToStr(Now);
   Sheet.Cells[2, v_cloumn+1].Font.bold := True;
   v_cloumn:=0;
   //列头
   for iCount := 0 to TDBGrideh(DBGrideh1).Columns.Count - 1 do
     if TDBGrideh(DBGrideh1).Columns.Items[iCount].Visible=true then
       begin
        Sheet.Cells[3, iCount + 1 - v_cloumn] :=
         TDBGrideh(DBGrideh1).Columns.Items[iCount].Title.Caption;
        Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
       end
     else
      inc(v_cloumn);
   jCount := 4;
   //行
   while not TDBGrideh(DBGrideh1).DataSource.DataSet.Eof do
     begin
      v_cloumn:=0;
      for iCount := 0 to TDBGrideh(DBGrideh1).Columns.Count - 1 do
       if TDBGrideh(DBGrideh1).Columns.Items[iCount].Visible=true then
         begin
          Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=
            TDBGrideh(DBGrideh1).Columns.Items[iCount].Field.AsString;
         end
       else
        inc(v_cloumn);
      Inc(jCount);
      TDBGrideh(DBGrideh1).DataSource.DataSet.Next;
     end; //end while
   XlApp.Visible := True;
   TDBGrideh(DBGrideh1).DataSource.DataSet.EnableControls;

 Screen.Cursor := crDefault;

end;
//退出
procedure TFmain.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,'固定资产查询')
end;

//查看
procedure TFmain.N4Click(Sender: TObject);
begin
 try
  Application.CreateForm(TFrmFass, FrmFass);

  SetValFass(FrmFass);
  FrmFass.BitBtn1.Enabled :=false;
  FrmFass.TabSheet1.Enabled :=false;
  FrmFass.TabSheet2.Enabled :=false;
  FrmFass.ShowModal;
  FrmFass.free;
 except
  on E: Exception do
   begin
     FrmFass.free;
     messagedlg(E.Message,mtinformation,[mbok],0);
   end;
 end;
end;
//打印
procedure TFmain.Edit1Change(Sender: TObject);
begin
 if trim(edit1.text)<>'' then
    dm.Qery517.Filter :=_FN+' like ''%'+trim(edit1.text)+'%'''
  else
    dm.Qery517.Filter :='';
end;
procedure TFmain.Edit2Change(Sender: TObject);
begin
   if trim(edit2.text)<>'' then
    dm.Qery517.Filter :=_FN+' >='+trim(edit2.text)
  else
    dm.Qery517.Filter :='';
end;
procedure TFmain.DateTimePicker1Change(Sender: TObject);
begin
   dm.Qery517.Filter :=_FN+' >= '+datetostr(DateTimePicker1.Date);
end;


procedure TFmain.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFmain.BitBtn4Click(Sender: TObject);
var
  i:integer;
  sqlstr:string;
begin
  with TfrmQuerySet.Create(Application)do
  try
    if ShowModal = mrOk then
    begin
      for i:=1 to sgrid1.RowCount-2 do
      begin
        if sgrid1.Cells[2,i]<> '' then
          Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      end;
    {  if rgAssetStatus.ItemIndex = 0 then//存在
        sqlstr:= sqlstr+' and data0517.active_flag=1 '
      else if rgAssetStatus.ItemIndex = 1 then//不存在
        sqlstr:= sqlstr+' and data0517.active_flag=0 '
      else
        sqlstr:= sqlstr+' and data0517.active_flag in (0,1) ';  }
    end;
  finally
    free;
  end;
  DoSearch(sqlstr);
end;

procedure TFmain.DoSearch(subSql: string);
var
  sqlstr:widestring;
  i:integer;
begin
  if subsql='' then exit;
  sqlstr:=uppercase(sSql);
  i:=Pos('AND (1=1)',sqlstr);
  if i = 0 then
  begin
    ShowMsg('SQL语句出错,请联系系统管理员',1);
    abort;
  end;
  Sqlstr:=copy(sqlstr,1,i-1);
  DM.Qery517.Close;
  DM.Qery517.CommandText := sqlstr+' AND(1=1) '+subsql +' order by Data0517.Fasset_Code';
  DM.Qery517.open;
  StatusBar1.Panels[1].Text := IntToStr(DM.Qery517.RecordCount);

end;

procedure TFmain.BitBtn3Click(Sender: TObject);
begin
  Dm.Qery517.Filter :='';
  if Dm.Qery517.Active then
    RefreshData(dm.Qery517.fieldbyName('rKey').AsInteger)
  else
    RefreshData(0);
end;

procedure TFmain.RefreshData(rKey: integer);
begin
  dm.Qery517.close;
  dm.Qery517.open;
  dm.Qery517.Locate('rKey',rKey,[]);
  StatusBar1.Panels[1].Text := IntToStr(dm.Qery517.RecordCount);
end;

procedure TFmain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  (ssAlt in Shift) and (key=86) then
  showmessage(DM.Qery517.CommandText);
end;

procedure TFmain.pm1Popup(Sender: TObject);
var
  i:integer;
  MI:TMenuItem;
begin
  while pm1.Items.Count>0 do
    pm1.Items[0].free;
  for i:= 0 to DBGridEh1.Columns.Count- 1 do
  begin
    MI:=TmenuItem.Create(self);
    MI.Caption:=DBGridEh1.Columns[i].Title.Caption;
    if DBGridEh1.Columns[i].Visible then
      MI.Checked:=true;
    MI.OnClick:=item_click;
    self.pm1.Items.Add(MI);
  end;
end;
procedure TFmain.btn2Click(Sender: TObject);
begin
  pm1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFmain.item_click(sender: TObject);
var
 i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  for i:=0 to DBGridEh1.Columns.Count-1 do
    if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible:=(sender as tmenuItem).Checked;
      break;
    end;
end;

end.

