unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, DateUtils;

type
  TFrmMain = class(TForm)
    Splitter1: TSplitter;
    pnlMain: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    BitBtn3: TBitBtn;
    pnlDetail: TPanel;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    dsaq60: TADODataSet;
    dsaq60rkey: TIntegerField;
    dsaq60sales_order: TStringField;
    dsaq60sales_date: TDateTimeField;
    dsaq60type: TWordField;
    dsaq60status: TWordField;
    dsaq60ship_method: TStringField;
    dsaq60ent_date: TDateTimeField;
    dsaq60ent_user_ptr: TIntegerField;
    dsaq60EMPLOYEE_NAME: TStringField;
    dsaq60currency_ptr: TIntegerField;
    dsaq60total_amount: TBCDField;
    dsaq60CONTACT_NAME: TStringField;
    dsaq60remark: TStringField;
    dsaq60MO_PTR: TIntegerField;
    dsaq60CUT_NO: TStringField;
    dsaq60SO_NO: TStringField;
    dsaq63: TADODataSet;
    dsaq63rkey: TAutoIncField;
    dsaq63so_ptr: TIntegerField;
    dsaq63prod_ptr: TIntegerField;
    dsaq63PROD_CODE: TStringField;
    dsaq63PRODUCT_NAME: TStringField;
    dsaq63PRODUCT_DESC: TStringField;
    dsaq63location_ptr: TIntegerField;
    dsaq63LOCATION: TStringField;
    dsaq63D0468_PTR: TIntegerField;
    dsaq63quantity: TBCDField;
    dsaq63price: TBCDField;
    dsaq63returen_qty: TBCDField;
    dsaq63remark: TStringField;
    dsaq63QUAN_ISSUED: TFloatField;
    dsaq63STATUS: TSmallintField;
    N3: TMenuItem;
    N5: TMenuItem;
    dsaq63UNIT_NAME: TStringField;
    dsaq63qty_on_hand01: TBCDField;
    dsaq63qty_onhand08: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
    v_colwidth,v_colwidth1 : array of integer;
    field_name : string;
    OldGridWnd : TWndMethod;
    dbgrid2_coltotal:integer;
    procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
    sys_longdate,sys_sortdate:TDateTime;
    user_ptr,employee_name:string;
    function ExistInventory(HD:THandle;Qry:TADOQuery):Boolean;
  end;

var
  FrmMain: TFrmMain;

implementation

uses UnitDataModal, common,UnitPutOut, UnitReturnDetail;

{$R *.dfm}


procedure TFrmMain.FormCreate(Sender: TObject);
begin
//  if dm.ADOConnection1.Connected then
//    begin
//      showmessage('程序处于开发模式下运行，请在发布前断开数据库连接后编译！');
//      rkey73 := '4';
//      vprev := '4';
//    end
//  else

    if not App_init_2(dm.ADOConnection1) then
    begin
     showmsg('程序启动失败,请与管理员联系!',1);
     application.Terminate;
    end;  
  self.Caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
  field_name:='SALES_ORDER';
  dbgrid2_coltotal:=dbgrid1.Width;
end;

function TFrmMain.ExistInventory(HD:THandle;Qry:TADOQuery):Boolean;
begin                          //用于检查是否存在未结的成品盘点记录。彭华于20121101
  Result:=False;
  with Qry do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey from data0214 where STATUS=0';
    Open;
    if IsEmpty=False then
    begin
      MessageBox(HD,'现存在未结的成品盘点记录，请先处理！','错误',MB_ok+MB_iconStop);
      Result:=True;
    end;
    Close;
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  i:byte;
begin
  if dm.ADOConnection1.Connected then
  begin
    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='SELECT GETDATE() AS sys_date,'+#13+
       'CONVERT(datetime, CONVERT(varchar, GETDATE(), 101), 101) AS sort_date';
      open;
      sys_longdate:=fieldvalues['sys_date'];
      sys_sortdate:=fieldvalues['sort_date'];
    end;

    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='select EMPLOYEE_PTR from data0073 where rkey='+rkey73;
      open;
      user_ptr:=fieldvalues['EMPLOYEE_PTR'];
    end;

    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='select EMPLOYEE_NAME from data0005 where rkey='+user_ptr;
      open;
      self.employee_name:=fieldvalues['EMPLOYEE_NAME'];
    end;
  end;

  dtpk2.Date:=sys_sortdate;
  dtpk1.Date:=dtpk2.Date-dayof(dtpk2.Date)+1;
  dtpk1CloseUp(sender);
  dsaq63.Open;
  setlength(v_colwidth,dbgrid1.FieldCount);
  setlength(v_colwidth1,dbgrid2.FieldCount);
  for i:=0 to high(v_colwidth) do v_colwidth[i] := dbgrid1.Columns[i].Width;
  for i:=0 to high(v_colwidth1) do v_colwidth1[i] := dbgrid2.Columns[i].Width;
end;

procedure TFrmMain.NewGridWnd(var Message: TMessage);
var
  IsNeg : Boolean;
begin
  if Message.Msg = WM_MOUSEWHEEL then
  begin
    IsNeg := Short(Message.WParamHi) < 0;
    if IsNeg then
      DBGrid1.DataSource.DataSet.MoveBy(1)
    else
      DBGrid1.DataSource.DataSet.MoveBy(-1)
  end
  else
    OldGridWnd(Message);
end;

procedure TFrmMain.FormResize(Sender: TObject);
var
  i:byte;
begin
  for i:=low(v_colwidth) to high(v_colwidth) do
    dbgrid1.Columns[i].Width:=v_colwidth[i]+
     round((dbgrid1.Width-dbgrid2_coltotal)*v_colwidth[i]/(dbgrid2_coltotal-28));
  for i:=low(v_colwidth1) to high(v_colwidth1) do
    dbgrid2.Columns[i].Width:=v_colwidth1[i]+
     round((dbgrid2.Width-dbgrid2_coltotal)*v_colwidth1[i]/(dbgrid2_coltotal-28));
end;

procedure TFrmMain.dtpk1CloseUp(Sender: TObject);
begin
  dsaq60.Close;
  dsaq60.Parameters[0].Value:=dtpk1.Date;
  dsaq60.Parameters[1].Value:=dtpk2.Date+1;
  dsaq60.Open;
end;

procedure TFrmMain.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    dsaq60.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
  else
    dsaq60.Filter:='';
end;

procedure TFrmMain.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dsaq60.CommandText);
end;

procedure TFrmMain.DBGrid1TitleClick(Column: TColumn);
var
  i:byte;
begin
  if (dsaq60.IndexFieldNames<>column.FieldName) then
    dsaq60.IndexFieldNames:=column.FieldName;

  if (column.ReadOnly) and (field_name<>column.FieldName) then
    begin
      label1.Caption:=column.Title.Caption;
      self.field_name:=column.FieldName;
      edit1.SetFocus;
      for i:=0 to dbgrid1.FieldCount-1 do
        if dbgrid1.Columns[i].Title.Color= clred then
          dbgrid1.Columns[i].Title.Color:= clbtnface;
      column.Title.Color:=clred;
    end
  else
    edit1.SetFocus;
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
var
  v_rkey60: integer;
begin
  v_rkey60 := 0;
  if not dsaq60.IsEmpty then v_rkey60 := dsaq60rkey.Value;
  dsaq60.Close;
  dsaq60.Open;
  if v_rkey60 > 0 then dsaq60.Locate('rkey',v_rkey60,[]);
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.N3Click(Sender: TObject);
begin
  if  FrmMain.ExistInventory(Self.Handle,DM.aqTmp) then
    Exit;

  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
    try
      FrmPutOut:=TFrmPutOut.Create(Application);
      DM.ado04.Close;
      DM.ado04.Open;
      DM.ads492_468.Close;
      FrmPutOut.Edit1.Text:=dm.ado04SEED_VALUE.Value;
      FrmPutOut.StatusBar1.Panels[1].Text:=employee_name;
      FrmPutOut.StatusBar1.Panels[2].Text:='发料日期:'+
      formatdatetime('yyyy-mm-dd HH:mm:ss',sys_longdate);
      FrmPutOut.DateTimePicker1.Date:= self.sys_sortdate;
      FrmPutOut.ShowModal;
    finally
      FrmPutOut.Free;
      BitBtn3Click(nil);
    end;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dm.ads492_468.Active then dm.ads492_468.Close;
  if dm.ads08.Active then dm.ads08.Close;
end;

procedure TFrmMain.N2Click(Sender: TObject);
var
  rkey63:integer;
begin
  if  ExistInventory(Self.Handle,DM.aqTmp) then
    Exit;

  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
    begin
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select TOP 1 TDATE From Data0444 Where CLOSED = ''Y'' Order By RKEY Desc');
        Open;
      end;
      if dsaq60ent_date.AsDateTime<dm.aqTmp.FieldByName('TDATE').AsDateTime then
      begin
        ShowMessage('成本已核算,不允许退回!');
        Abort;
      end;
          
      rkey63:=dsaq63rkey.Value;
      dsaq63.Close;
      dsaq63.Open;
      if dsaq63.Locate('rkey',rkey63,[]) and (dsaq63quantity.Value > dsaq63returen_qty.Value) then
      begin
        FrmReturnDetail:=TFrmReturnDetail.Create(application);
        FrmReturnDetail.Edit1.Text:=dsaq63quantity.AsString;
        FrmReturnDetail.Edit2.Text:=dsaq63UNIT_NAME.Value;
        FrmReturnDetail.Edit3.Text:=formatfloat('0.000',dsaq63quantity.Value-
                                                        dsaq63returen_qty.Value);
        FrmReturnDetail.Edit4.Text:=FrmReturnDetail.Edit3.Text;

        if FrmReturnDetail.ShowModal=mrok then
        begin
          dm.ADOConnection1.BeginTrans;
          try
            dm.aqry63.close;
            dm.aqry63.Open;
            dsaq63.Edit;
            dsaq63qty_on_hand01.Value:=dsaq63qty_on_hand01.Value+   //修改wzcp0001增加当前库存
                                     strtocurr(FrmReturnDetail.Edit4.Text);

            dsaq63qty_onhand08.Value:=dsaq63qty_onhand08.Value+
                                 strtocurr(FrmReturnDetail.Edit4.Text); //库存data0008中的退货的数量

            dsaq63QUAN_ISSUED.Value:=dsaq63QUAN_ISSUED.Value-  //468配料单中已发放数量
                              strtocurr(FrmReturnDetail.Edit4.Text);
            dsaq63STATUS.Value:=0;        //468中的发放状态

            DM.aqry63.Append;
            DM.aqry63so_ptr.Value :=dsaq63so_ptr.Value;    //wzcp0060.rkey
            DM.aqry63prod_ptr.Value :=dsaq63prod_ptr.Value;   //data0008.rkey
            DM.aqry63location_ptr.Value :=dsaq63location_ptr.Value; //data0016.rkey
            DM.aqry63price.Value :=dsaq63price.Value;           //价格
            DM.aqry63tax_rate.Value :=0;                        //增值税率
            DM.aqry63quantity.Value :=-strtocurr(FrmReturnDetail.Edit4.Text); //数量
            DM.aqry63remark.Value :=dsaq63remark.Value;          //备注
            DM.aqry63D0468_PTR.Value :=dsaq63D0468_PTR.Value; //DATA0468.RKEY
            DM.aqry63sales_date.Value := getsystem_date(DM.ADOQuery1,1);
            DM.aqry63.Post;

            dsaq63returen_qty.Value:=dsaq63returen_qty.Value+strtocurr(FrmReturnDetail.Edit4.Text);  //207
            dsaq63.Post;
            dm.ADOConnection1.CommitTrans;
            messagedlg('退仓操作成功!', mtinformation,[mbok],0);
            dsaq63.Close;
            dsaq63.Open;
          except
            on E: Exception do
            begin
              dm.ADOConnection1.RollbackTrans;
              messagedlg(E.Message,mterror,[mbcancel],0);
            end;
          end;
        end;
        FrmReturnDetail.Free;
      end;
    end;
end;

procedure TFrmMain.N1Click(Sender: TObject);

begin

  if   ExistInventory(Self.Handle,DM.aqTmp) then
    Exit;

  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else

    if messagedlg('全部退回仓库，您确定?',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select TOP 1 TDATE From Data0444 Where CLOSED = ''Y'' Order By RKEY Desc');
        Open;
      end;
      if dsaq60ent_date.AsDateTime<dm.aqTmp.FieldByName('TDATE').AsDateTime then
      begin
        ShowMessage('成本已核算,不允许退回!');
        Abort;
      end;
      dm.ADOConnection1.BeginTrans;
      try
        begin
          dsaq63.Close;
          dsaq63.Open;

          dm.aqry63.close;
          dm.aqry63.Open;
          
          with dm.ADOQuery1 do
          begin
            close;
            sql.Text:='UPDATE Data0008'+#13+
                      'SET qty_onhand =qty_onhand+sum_qty63.sum_qty'+#13+
                      'FROM Data0008 INNER JOIN'+#13+
                      '     (SELECT prod_ptr, SUM(quantity - returen_qty) AS sum_qty'+#13+
                      '      FROM WZCP0063'+#13+
                      '      WHERE (quantity - returen_qty > 0) AND (so_ptr = '+dsaq60rkey.AsString+')'+#13+
                      '      GROUP BY prod_ptr) AS sum_qty63 ON Data0008.RKEY = sum_qty63.prod_ptr';
            execsql;  //增加DATA0008总库存
          end;

          with dm.ADOQuery1 do
          begin
            close;
            sql.Text:='UPDATE WZCP0001'+#13+
                      'SET qty_on_hand = WZCP0001.qty_on_hand + sum_qty63.sum_qty'+#13+
                      'FROM (SELECT location_ptr, prod_ptr, SUM(quantity - returen_qty) AS sum_qty'+#13+
                      '      FROM WZCP0063'+#13+
                      '      WHERE (quantity - returen_qty > 0) AND (so_ptr = '+dsaq60rkey.AsString+')'+#13+
                      '      GROUP BY prod_ptr, location_ptr) AS sum_qty63 INNER JOIN'+#13+
                      '     WZCP0001 ON sum_qty63.prod_ptr = WZCP0001.proc_ptr AND sum_qty63.location_ptr = WZCP0001.location_ptr';
            execsql;  //增加WZCP0001分仓库存
          end;

          with dm.ADOQuery1 do
          begin
           close;
           sql.Text:='UPDATE Data0468'+#13+
                     'SET QUAN_ISSUED = Data0468.QUAN_ISSUED - sum_qty63.sum_qty'+#13+
                     'FROM Data0468 INNER JOIN'+#13+
                     '     (SELECT prod_ptr, SUM(quantity - returen_qty) AS sum_qty, D0468_PTR'+#13+
                     '      FROM WZCP0063'+#13+
                     '      WHERE (quantity - returen_qty > 0) AND (so_ptr = '+dsaq60rkey.AsString+')'+#13+
                     '      GROUP BY D0468_PTR, prod_ptr) AS sum_qty63 ON Data0468.RKEY = sum_qty63.D0468_PTR AND Data0468.INVENT_PTR = sum_qty63.prod_ptr';
           execsql;     //修改468库已发放数量
          end;

          dsaq63.First;
          while not dsaq63.Eof do
          begin
            if dsaq63quantity.Value > dsaq63returen_qty.Value then
            begin
              DM.aqry63.Append;
              DM.aqry63so_ptr.Value :=dsaq60rkey.Value;   //wzcp0060.rkey
              DM.aqry63prod_ptr.Value :=dsaq63prod_ptr.Value;     //data0008.rkey
              DM.aqry63location_ptr.Value :=dsaq63location_ptr.Value; //data0016.rkey
              DM.aqry63quantity.Value :=-(dsaq63quantity.Value-dsaq63returen_qty.Value); //数量
              DM.aqry63price.Value :=dsaq63price.Value;  //单价
              DM.aqry63tax_rate.Value :=0;               //增值税率
              DM.aqry63returen_qty.Value :=0;             //退货数量
              DM.aqry63remark.Value :=dsaq63remark.value; //备注
              DM.aqry63D0468_PTR.Value :=dsaq63D0468_PTR.Value;//data0468.rkey
              DM.aqry63sales_date.Value := getsystem_date(DM.ADOQuery1,1);
              DM.aqry63.Post;
              dsaq63.Edit;
              dsaq63returen_qty.value:=dsaq63returen_qty.value+
                                      (dsaq63quantity.Value - dsaq63returen_qty.Value);
              dsaq63STATUS.Value :=0; //更新468的状态为有效
              dsaq63.Post;
            end;
            dsaq63.Next;
          end;
        end;

        dm.ADOConnection1.CommitTrans;
        messagedlg('全部退仓操作成功!', mtinformation,[mbok],0);
        dsaq63.Close;
        dsaq63.Open;
      except
        on E: Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end;
end;

procedure TFrmMain.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=not dsaq63.IsEmpty; 
end;

end.

