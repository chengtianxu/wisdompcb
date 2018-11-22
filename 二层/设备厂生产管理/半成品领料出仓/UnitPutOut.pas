unit UnitPutOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, Buttons, DBGrids, Grids, ComCtrls, Math;

type
  TFrmPutOut = class(TForm)
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    SGrid1: TStringGrid;
    DBGrid1: TDBGrid;
    SGrid2: TStringGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    btn1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    Edit7: TEdit;
    BitBtn6: TBitBtn;
    CheckBox2: TCheckBox;
    BitBtn7: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Timer1: TTimer;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
    procedure update_04(v_seed: string);
    function find_soerror(var number:string):boolean;
    function find_01rkey: boolean;
    function find_468rkey: boolean;
    procedure update_grid1();

  public
    { Public declarations }
  end;

var
  FrmPutOut: TFrmPutOut;

implementation

{$R *.dfm}
uses
   UnitMain, UnitDataModal, Pick_Item_Single ,ConstVar, UnitProdStock, common;


procedure TFrmPutOut.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='产品编码';
  sgrid1.Cells[1,0]:='产品名称';
  sgrid1.Cells[2,0]:='产品规格';
  sgrid1.Cells[3,0]:='仓库位置';
  sgrid1.Cells[4,0]:='发放单位';
  sgrid1.Cells[5,0]:='发放数量';
  sgrid1.Cells[6,0]:='备注';

  sgrid2.Cells[0,0]:='08.rkey';
  sgrid2.Cells[1,0]:='16.rkey';
  sgrid2.Cells[2,0]:='468.rkey';
  sgrid2.Cells[3,0]:='01.rkey';

  FrmProdStock:=TFrmProdStock.Create(application);

end;

procedure TFrmPutOut.FormDestroy(Sender: TObject);
begin
  FrmProdStock.Free;
end;

procedure TFrmPutOut.Timer1Timer(Sender: TObject);
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='SELECT GETDATE() AS sys_date,'+#13+
              'CONVERT(datetime, CONVERT(varchar, GETDATE(), 101), 101) AS sort_date';
    open;
    FrmMain.sys_longdate:=fieldvalues['sys_date'];
    FrmMain.sys_sortdate:=fieldvalues['sort_date'];
  end;
  StatusBar1.Panels[2].Text:='发料日期:'+
  formatdatetime('yyyy-mm-dd HH:mm:ss',FrmMain.sys_longdate);
end;

procedure TFrmPutOut.BitBtn6Click(Sender: TObject);
var i,j:Integer;
  InputVar: PDlgInput ;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
    InputVar.Fields:='CUT_NO/生产单号/100,SO_NO/销售订单/100,'+
    'PRODUCT_NAME/产品名称/100,PRODUCT_DESC/规格/100,ISSUE_DATE/投产日期/100,'+
    'REMARK/备注/100';

    InputVar.Sqlstr:=
    'SELECT DISTINCT dbo.data0492.rkey, dbo.data0492.CUT_NO, dbo.data0492.SO_NO, '+#13+
    '                dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, dbo.data0492.ISSUE_DATE, '+#13+
    '                dbo.data0492.REMARK '+#13+
    'FROM dbo.data0492 INNER JOIN '+#13+
    '     dbo.Data0008 ON dbo.data0492.BOM_PTR = dbo.Data0008.RKEY INNER JOIN '+#13+
    '     dbo.Data0468 ON dbo.data0492.CUT_NO = dbo.Data0468.CUT_NO '+#13+
    'WHERE (dbo.Data0468.STATUS = 0) AND (dbo.Data0468.invent_or = 1) AND '+#13+
    '      (dbo.data0492.TSTATUS = 0 OR dbo.data0492.TSTATUS = 2) '+#13+
    'ORDER BY dbo.data0492.rkey ';
    inputvar.KeyField:='CUT_NO';
    inputvar.InPut_value:=edit2.Text;
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.ado04.Close;
      DM.ado04.Open;
      Edit1.Text:=Trim(DM.ado04SEED_VALUE.AsString);
      edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUT_NO']);
      edit7.Text:= frmPick_Item_Single.adsPick.Fieldbyname('REMARK').AsString;

      dm.ads492_468.Close;
      dm.ads492_468.Parameters.ParamValues['rkey492']:=
                      frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      dm.ads492_468.Open;
//20160302添加自动发放功能
      for i:=1 to SGrid1.rowcount-1 do
         for j:=1 to SGrid1.colcount do
             SGrid1.cells[j-1,i]:='';
      SGrid1.RowCount:=2;
      for i:=1 to SGrid2.rowcount-1 do
         for j:=1 to SGrid2.colcount do
             SGrid2.cells[j-1,i]:='';
      SGrid2.RowCount:=2;
//----end----
      bitbtn7.Enabled:=true;
      btn1.Enabled:=true;
      edit3.SetFocus;
    end
    else
      edit2.SetFocus;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmPutOut.update_04(v_seed: string);
var
  i,v_length:integer;
  v_last,new_seed:string;
begin
  dm.ado04.Close;
  dm.ado04.Open;
  if dm.ADO04SEED_FLAG.Value<>1 then
  begin
    v_length := length(v_seed);
    for i := v_length downto 1 do
      if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
      begin
        v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
        new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
        dm.Ado04.Edit; //使前缀不变后缀加1
        dm.ADO04SEED_VALUE.Value := new_seed;
        dm.Ado04.Post;
        break;
      end
      else
        if i=1 then //如果第一位仍然是数字
        begin
          v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
          new_seed := copy(v_last,2,v_length);
          dm.Ado04.Edit;
          dm.ADO04SEED_VALUE.Value := new_seed;
          dm.Ado04.Post;
        end;
  end;
end;

procedure TFrmPutOut.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then edit3.SetFocus;
end;

procedure TFrmPutOut.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then dbgrid1.SetFocus;
end;

procedure TFrmPutOut.N7Click(Sender: TObject);
begin
  if not dbgrid1.DataSource.DataSet.IsEmpty then
    Export_dbGrid_to_Excel(dbgrid1,edit2.Text);
end;

procedure TFrmPutOut.N1Click(Sender: TObject);
var
  i:Integer;
  FilterString:string;
begin
  if not DM.ads492_468.IsEmpty then
  begin
    DM.ads08.Close;
    DM.ads08.Parameters[0].Value:=dm.ads492_468RKEY08.Value;

    FilterString :='';
    if SGrid2.RowCount >2 then
    begin
      FilterString :='((rkey16 <> '+SGrid2.Cells[1,1]+') OR (rkey08 <> '+SGrid2.Cells[0,1]+'))';
      for i:=2 to SGrid2.RowCount-2 do
      begin
        FilterString := FilterString +
          'OR ((rkey16 <>'+SGrid2.Cells[1,i]+') OR (rkey08 <> '+SGrid2.Cells[0,i]+'))';
      end;
    end;
    DM.ads08.Filtered:=False;
    DM.ads08.Filter :=FilterString;
    DM.ads08.Filtered :=True;

    DM.ads08.Open;
  end;

  if not DM.ads08.IsEmpty then
  begin
    FrmProdStock.ShowModal;
    if sgrid1.RowCount>2 then
    begin
      edit2.Enabled:=false;
      bitbtn6.Enabled:=false;
    end;
  end
  else
  messagedlg('仓库没有找到该半成品的库存!',mterror,[mbcancel],0);

end;

procedure TFrmPutOut.PopupMenu1Popup(Sender: TObject);
begin
  if DM.ads492_468.IsEmpty then
  begin
    n1.Enabled:=false;
    n2.Enabled:=false;
    n3.Enabled:=false;
    n6.Enabled:=false;
    n7.Enabled:=false;
  end
  else
    begin
      n6.Enabled:=true;
      n7.Enabled:=true;
      if dm.ads492_468STATUS.Value=0 then
      begin
        n1.Enabled:=true;
        n2.Enabled:=true;
        n3.Enabled:=false;
      end
      else
        begin
          n1.Enabled:=false;
          n2.Enabled:=false;
          n3.Enabled:=true;
        end;
    end;
end;

procedure TFrmPutOut.PopupMenu2Popup(Sender: TObject);
begin
  if sgrid1.Row=sgrid1.RowCount-1 then
    n4.Enabled:=false
  else
    n4.Enabled:=true;
end;

procedure TFrmPutOut.N4Click(Sender: TObject);
var
  i:integer;
begin
  dm.ads08.Filtered:=False;
  DM.ads08.Filter:='';
  if (dm.ads08.Locate('rkey16',strtoint(sgrid2.Cells[1,sgrid1.Row]),[])) and
     (dm.ads492_468.Locate('rkey468',strtoint(sgrid2.Cells[2,sgrid1.Row]),[])) then
  begin
    dm.ads08.Edit;
    dm.ads08qty_on_hand_01.Value:=dm.ads08qty_on_hand_01.Value+
                          strtocurr(sgrid1.Cells[5,sgrid1.Row]);
    dm.ads08.Post;
    dm.ads492_468.Edit;
    dm.ads492_468QUAN_ISSUED.Value:=dm.ads492_468QUAN_ISSUED.Value-
                           strtocurr(sgrid1.Cells[5,sgrid1.Row]);
    if dm.ads492_468STATUS.Value=1 then
    dm.ads492_468STATUS.Value:=0;
    dm.ads492_468.Post;

    for i:=sgrid1.Row to sgrid1.RowCount-2 do
    begin
      sgrid1.Rows[i]:=sgrid1.Rows[i+1];
      sgrid2.Rows[i]:=sgrid2.Rows[i+1];
    end;

    sgrid1.RowCount:=sgrid1.RowCount-1;
    sgrid2.RowCount:=sgrid2.RowCount-1;

    if sgrid1.RowCount<=2 then
    begin
      edit3.Enabled:=true;
      bitbtn3.Enabled:=true;
      edit2.Enabled:=true;
      bitbtn6.Enabled:=true;
    end;
  end
  else
    messagedlg('删除操作不成功!',mterror,[mbcancel],0);
end;

procedure TFrmPutOut.BitBtn2Click(Sender: TObject);
var
  number:string;
  i:integer;
//  total_amount:Currency;
begin
  if FrmMain.ExistInventory(Self.Handle,DM.aqTmp) then
    Exit;

  if (DM.ads492_468.IsEmpty) or (Trim(Edit2.Text)='') then
  begin
    ShowMessage('请选择一个生产单号！');
    Edit2.SetFocus;
    Exit;
  end;

  if SGrid1.RowCount=2 then
  begin
    ShowMessage('请输入发放数量！');
    Exit;
  end;

  if Trim(Edit3.Text)='' then
  begin
    ShowMessage('请输入装运方式！');
    Edit3.SetFocus;
    Exit;
  end;

  if Trim(Edit5.Text)='' then
  begin
    ShowMessage('请输入领料人！');
    Edit5.SetFocus;
    Exit;
  end;  

  number:=trim(edit1.Text);
  if find_soerror(number) then
  begin
    edit1.Text:=number;
    messagedlg('出仓单号重复,可能有多台计算机同时新增,系统自动更新编号为:'+number,
          mtinformation,[mbok],0);
  end;

  if find_01rkey then
  begin
    messagedlg('半成品出仓失败，库存记录发生变化!请重新选择库存发放',mterror,[mbcancel],0);
    update_grid1;
    exit;
  end;

  if find_468rkey then
  begin
    messagedlg('半成品出仓失败，领料单状态发生变化!请重新选择库存发放',mterror,[mbcancel],0);
    self.update_grid1;
    exit;
  end;

  dm.ADOConnection1.BeginTrans;
  try
    dm.aqry60.Close;
    dm.aqry60.Open;
    dm.aqry60.Append;
    dm.aqry60sales_order.Value:=edit1.Text;
    DM.aqry60sales_date.Value:=DateTimePicker1.Date;
    DM.aqry60type.Value :=3;
    DM.aqry60status.Value :=3;
    DM.aqry60ship_method.Value :=Trim(Edit3.Text);
    DM.aqry60ent_date.Value :=getsystem_date(dm.ADOQuery1,0);
    DM.aqry60ent_user_ptr.Value :=strtoint(FrmMain.user_ptr);
    DM.aqry60currency_ptr.Value :=1;
{    total_amount :=0;
    for  i :=1  to SGrid1.RowCount-2 do
    begin
      //total_amount :=total_amount + dm.ads492_468new_price.Value * StrToCurr(SGrid1.Cells[5,i] );
      total_amount :=total_amount + dm.ads492_468new_price.Value * StrToCurr(SGrid1.Cells[5,i] );
    end; }
//    DM.aqry60total_amount.Value :=total_amount;
    DM.aqry60CONTACT_NAME.Value :=Edit5.Text;
    DM.aqry60remark.Value :=Edit7.Text;
    DM.aqry60MO_PTR.Value :=DM.ads492_468RKEY492.Value;
    DM.aqry60CONF_DATE.Value :=getsystem_date(dm.ADOQuery1,0);
    DM.aqry60CONF_BY_EMPL_PTR.Value :=strtoint(FrmMain.user_ptr);
    DM.aqry60.Post;

    DM.aqry63.Close;
    dm.aqry63.Open;
    for i:=1 to sgrid2.RowCount-2 do
    begin
      DM.aqry63.Append;
      DM.aqry63so_ptr.Value:=DM.aqry60rkey.Value;
      DM.aqry63prod_ptr.AsString:=SGrid2.Cells[0,i];
      DM.aqry63location_ptr.AsString:=SGrid2.Cells[1,i];
      DM.aqry63quantity.AsString:=SGrid1.Cells[5,i];
      DM.aqry63price.Value:=DM.ads492_468new_price.Value;
      DM.aqry63tax_rate.Value:=0;
      DM.aqry63returen_qty.Value:=0;
      DM.aqry63remark.Value:=SGrid1.Cells[6,i];
      DM.aqry63D0468_PTR.AsString:=SGrid2.Cells[2,i];
      DM.aqry63sales_date.Value := DateTimePicker1.Date;
      DM.aqry63.Post;
 //     DM.ads492_468.Next;
    end;
    with dm.ADOQuery1 do
    begin
      close;
      SQL.Text:='SELECT dbo.WZCP0001.rkey'+#13+
                'FROM dbo.WZCP0001 INNER JOIN'+#13+
                '    (SELECT prod_ptr, location_ptr, SUM(quantity) AS qty'+#13+
                '     FROM dbo.WZCP0063'+#13+
                '     WHERE so_ptr = '+dm.aqry60rkey.AsString+#13+
                '     GROUP BY prod_ptr, location_ptr) AS d1 '+#13+
                '     ON dbo.WZCP0001.proc_ptr = d1.prod_ptr AND '+#13+
                '        dbo.WZCP0001.location_ptr = d1.location_ptr AND'+#13+
                '        dbo.WZCP0001.qty_on_hand < d1.qty';
      open;
    end;

    if not dm.ADOQuery1.IsEmpty then
    begin
      dm.ads492_468.CancelBatch();
      dm.ads08.CancelBatch();
      dm.ADOConnection1.RollbackTrans;
      messagedlg('出仓失败,可能多用户同时发放了同一批半成品且导致库存出现负数!请重新操作', mterror,[mbcancel],0);
      update_grid1;
    end
    else
      begin
        dm.ads492_468.UpdateBatch();

        dm.ads08.CancelBatch();

        with dm.ADOQuery1 do
        begin
          close;
          sql.Text:='update WZCP0001'+#13+
                 'set WZCP0001.qty_on_hand=WZCP0001.qty_on_hand-d1.qty'+#13+
                 'FROM dbo.WZCP0001 INNER JOIN'+#13+
                 '    (SELECT prod_ptr, location_ptr, SUM(quantity) AS qty'+#13+
                 '     FROM dbo.WZCP0063'+#13+
                 '     WHERE so_ptr = '+dm.aqry60rkey.AsString+#13+
                 '     GROUP BY prod_ptr, location_ptr) AS d1 '+#13+
                 '     ON dbo.WZCP0001.proc_ptr = d1.prod_ptr AND '+#13+
                 '        dbo.WZCP0001.location_ptr = d1.location_ptr';
          execsql;     //减去wzcp0001库存
        end;

        with dm.ADOQuery1 do
        begin
          close;
          sql.Text:='update DATA0008'+#13+
                    'set Data0008.qty_onhand=Data0008.qty_onhand-d1.qty'+#13+
                    'FROM dbo.Data0008 INNER JOIN'+#13+
                     ' (SELECT prod_ptr, SUM(quantity) AS qty'+#13+
                     '  FROM dbo.WZCP0063'+#13+
                     '  WHERE so_ptr = '+dm.aqry60rkey.AsString+#13+
                     '  GROUP BY prod_ptr) AS d1 ON Data0008.RKEY = d1.prod_ptr';
          execsql;     //更新库存DATA0008中的库存数量
        end;


        update_04(trim(edit1.Text));  //更新控制码
        dm.ADOConnection1.CommitTrans;
        messagedlg('恭喜!出仓成功!', mtinformation,[mbok],0);


        update_grid1;
        edit2.Text:='';
        edit2.SetFocus;
        label7.Caption:='';
        edit7.Text:='';
        dm.ads492_468.Close;
        dm.ads08.close;
      end;
  except
    on E: Exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
      dbgrid1.SetFocus;
    end;
  end;
end;

function TFrmPutOut.find_soerror(var number: string): boolean;
begin
  result := false;
  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from wzcp0060');
    sql.Add('where SALES_ORDER='''+number+'''');
    open;
    if not IsEmpty then
    begin
      dm.ado04.Close;
      dm.ado04.Open;
      number:=dm.ado04SEED_VALUE.Value;
      result := true;
    end;
  end;
end;

function TFrmPutOut.find_01rkey: boolean;
var
  i :integer;
begin
  result:=false;
  for i:=1 to sgrid2.RowCount-2 do
  begin
    with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Text:='select rkey from wzcp0001'+#13+
                'where rkey ='+sgrid2.Cells[3,i];
      open;
    end;
    if dm.ADOQuery1.IsEmpty then
     begin
       result:=true;
       break;
     end;
  end;
end;

procedure TFrmPutOut.update_grid1;
var
  i:integer;
begin
  dm.ado04.Close;
  dm.ado04.Open;
  edit1.Text:=dm.ado04SEED_VALUE.Value;
  for i:=1 to sgrid1.RowCount-2 do
  begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
  end;
  sgrid1.RowCount:=2;
  sgrid2.RowCount:=2;
  //edit3.Enabled:=true;
  //bitbtn3.Enabled:=true;
  edit2.Enabled:=true;
  bitbtn6.Enabled:=true;
  //bitbtn7.Enabled:=false;
end;

function TFrmPutOut.find_468rkey: boolean;
var
  i :integer;
begin
  result:=false;
  for i:=1 to sgrid2.RowCount-2 do
  begin
    with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Text:='select data0468.rkey '+#13+
                'from data0468 '+#13+
                'where data0468.status = 0'+#13+
                'and data0468.invent_or = 1'+#13+
                'and data0468.rkey = '+sgrid2.Cells[2,i];
      open;
    end;
    if dm.ADOQuery1.IsEmpty then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TFrmPutOut.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'DESCRIPTION/装运方法/500';
    InputVar.Sqlstr :='SELECT DESCRIPTION '+#13+
                      'FROM dbo.Data0370 ';
    inputvar.KeyField:='DESCRIPTION';
    inputvar.InPut_value:=edit3.Text;
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['DESCRIPTION']);
      Edit3.SetFocus;
    end
    else edit3.SetFocus;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrmPutOut.BitBtn5Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'EMPLOYEE_NAME/姓名/220,EMPL_CODE/工号/100,DEPT_NAME/部门/100';
    InputVar.Sqlstr :='SELECT dbo.Data0005.EMPLOYEE_NAME, dbo.Data0005.EMPL_CODE, dbo.Data0034.DEPT_NAME '+#13+
                      'FROM dbo.Data0005 INNER JOIN '+#13+
                      '     dbo.Data0034 ON dbo.Data0005.EMPLOYEE_ID = dbo.Data0034.RKEY';
    inputvar.KeyField:='EMPLOYEE_NAME';
    inputvar.InPut_value:=edit5.Text;
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit5.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']);
      Edit5.SetFocus;
    end
    else edit5.SetFocus;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrmPutOut.BitBtn7Click(Sender: TObject);
begin
//20160302添加自动发放功能
  if not dm.ads492_468.IsEmpty then
  begin
    dm.ads492_468.First;
    while not dm.ads492_468.Eof do
    begin
      DM.ads08.Close;
      DM.ads08.Parameters[0].Value:=dm.ads492_468RKEY08.Value;
      DM.ads08.Open;
      if not dm.ads08.IsEmpty then
      begin
        if ((dm.ads492_468QUAN_BOM.Value>dm.ads492_468QUAN_ISSUED.Value) and (dm.ads492_468qty_onhand.Value>0)) then
        begin
        SGrid1.Cells[0,sgrid1.RowCount-1]:=dm.ads492_468PROD_CODE.AsString;//产品编码
        SGrid1.Cells[1,sgrid1.RowCount-1]:=dm.ads492_468PRODUCT_NAME.AsString; //产品名称
        SGrid1.Cells[2,sgrid1.RowCount-1]:=dm.ads492_468PRODUCT_DESC.Value;//产品规格
        SGrid1.Cells[3,sgrid1.RowCount-1]:=dm.ads08LOCATION.Value;//仓库位置
        SGrid1.Cells[4,sgrid1.RowCount-1]:=dm.ads492_468UNIT_NAME.Value;//发放单位
        if (dm.ads492_468qty_onhand.Value<dm.ads492_468QUAN_BOM.Value-dm.ads492_468QUAN_ISSUED.Value) then //库存数量小于需求数
          SGrid1.Cells[5,sgrid1.RowCount-1]:=FloatToStr(dm.ads492_468qty_onhand.Value) //库存数
        else
          SGrid1.Cells[5,sgrid1.RowCount-1]:=FloatToStr(dm.ads492_468QUAN_BOM.Value-dm.ads492_468QUAN_ISSUED.Value);//需求数，发放数量
        SGrid1.Cells[6,SGrid1.RowCount-1]:=DM.ads492_468CUT_NO.AsString; //备注

        SGrid2.Cells[0,sgrid2.RowCount-1]:=dm.ads492_468RKEY08.AsString;//08.rkey
        SGrid2.Cells[1,sgrid2.RowCount-1]:=DM.ads08RKEY16.AsString;//16.rkey
        SGrid2.Cells[2,sgrid2.RowCount-1]:=dm.ads492_468RKEY468.AsString;//468.rkey
        SGrid2.Cells[3,sgrid2.RowCount-1]:=DM.ads08RKEY01.AsString; //01.rkey
        dm.ads08.Edit;
        dm.ads08qty_on_hand_01.Value:=dm.ads08qty_on_hand_01.Value-strtocurr(sgrid1.Cells[5,sgrid1.RowCount-1]);
        dm.ads08.Post;

        dm.ads492_468.Edit;
        dm.ads492_468QUAN_ISSUED.Value:=dm.ads492_468QUAN_ISSUED.Value+strtocurr(sgrid1.Cells[5,sgrid1.RowCount-1]);
        dm.ads492_468STATUS.Value:=1;
        dm.ads492_468.Post;
        SGrid1.RowCount:=SGrid1.RowCount+1;
        SGrid2.RowCount:=SGrid2.RowCount+1;
        end;
      end;
      dm.ads492_468.Next;
    end;
  end;
end;


end.

