unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ComCtrls, ExtCtrls, StdCtrls, Buttons, Menus,
  DBCtrlsEh, DBCtrls, Mask, DB, ADODB;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    Panel2: TPanel;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    SpeedButton2: TSpeedButton;
    Label17: TLabel;
    LBCust: TLabel;
    LBsale: TLabel;
    Edtsale: TEdit;
    MaskEdit1: TMaskEdit;
    EdtCust: TEdit;
    DBEdit6: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label2: TLabel;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Splitter1: TSplitter;
    SGrid: TStringGrid;
    ComboBox1: TComboBox;
    N2: TMenuItem;
    BtnOpen: TBitBtn;
    EdtTC: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    EdtKK: TEdit;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    SpeedButton1: TSpeedButton;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure BtnSaveClick(Sender: TObject);
    procedure EdtCustEnter(Sender: TObject);
    procedure EdtCustExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGridKeyPress(Sender: TObject; var Key: Char);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBox1Exit(Sender: TObject);
    procedure SGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BtnOpenClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGridTopLeftChanged(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure N5Click(Sender: TObject);
    procedure DBGridEh1Columns2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    Fcust:string;
    FinValid:boolean;
    FSALES_DISCOUNT:real;

    Fexchg,Fsk:real;
    Fx,Fy:integer;
    
    FisValid:boolean;
    procedure getdate(var D1,D2:Tdate);
    procedure sumTC;
    procedure sumKK;
    procedure getTCRate(sPCBTp:string;DisC:string='0');
  public
    Ftag:integer;
    procedure initd;
  end;

var
  Frm_detail: TFrm_detail;

implementation

uses DM_u,common,Pick_Item_Single,ConstVar,Frm_CF_u,discount_rate,Frm_YCB_u;

{$R *.dfm}


procedure TFrm_detail.initd;
var i:integer;
    sD1,sD2:Tdate;
begin
  SGrid.Cells[0,0]:='支票号';
  SGrid.Cells[1,0]:='收款日期';
  SGrid.Cells[2,0]:='货币';
  SGrid.Cells[3,0]:='汇率';
  SGrid.Cells[4,0]:='PCB类型';
  SGrid.Cells[5,0]:='加权折率%';
  SGrid.Cells[6,0]:='收款金额(RMB)';

  SGrid.Cells[7,0]:='税率%';
  SGrid.Cells[8,0]:='扣税金额';
  SGrid.Cells[9,0]:='贴息金额';
  SGrid.Cells[10,0]:='客户佣金';
  SGrid.Cells[11,0]:='材料工艺';
  SGrid.Cells[12,0]:='运费/报关';

  SGrid.Cells[13,0]:='提成基数';
  SGrid.Cells[14,0]:='提成比例%';
  SGrid.Cells[15,0]:='回款奖励%';
  SGrid.Cells[16,0]:='提成金额';
  SGrid.Cells[17,0]:='rkey114';
  SGrid.Cells[18,0]:='rkey01';
  SGrid.Cells[19,0]:='rkey123';
  SGrid.ColCount:=20;

  SGrid.ColWidths[2]:=25;
  SGrid.ColWidths[3]:=55;
  SGrid.ColWidths[4]:=55;
  SGrid.ColWidths[14]:=55;
  SGrid.ColWidths[15]:=55;
  SGrid.ColWidths[7]:=30;
  SGrid.ColWidths[5]:=55;
  SGrid.ColWidths[12]:=55;
  SGrid.ColWidths[6]:=85;
 
  SGrid.ColWidths[17]:=-1;
  SGrid.ColWidths[18]:=-1;
  SGrid.ColWidths[19]:=-1;
  ComboBox1.Width:=SGrid.ColWidths[4]-1;
  
  if Ftag=0 then
  begin
    self.Caption:='业务提成-新增';
    DM.GetNo(MaskEdit1,'75',0);
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT getdate()';
    DM.tmp.Open;
    DM.ADO122_1.Close;
    DM.ADO122_1.Parameters[0].Value:=-1;
    DM.ADO122_1.Open;
    DM.ADO122_1.Append;
    DM.ADO122_1.FieldByName('create_date').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
    getdate(sD1,sD2);
    DM.ADO122_1.FieldByName('coll_startdate').AsDateTime:=sD1;
    DM.ADO122_1.FieldByName('coll_enddate').AsDateTime:=sD2;
    DM.ADO124.Parameters[0].Value:=-1;
    DM.ADO124.Open;
  end else begin
    MaskEdit1.Enabled:=false;
    if Ftag=1 then
    begin
      self.Caption:='业务提成-修改';
      DM.ADO123_1.Parameters[0].Value:=DM.ADO122rkey.Value;
      DM.ADO123_1.Open;
    end else if Ftag=2 then begin
      self.Caption:='业务提成-查看';
      BtnSave.Enabled:=false;
      SGrid.PopupMenu:=nil;
      DBGridEh1.ReadOnly:=true;
    end else if Ftag=6 then
    begin
      self.Caption:='业务提成-复制';
      DM.GetNo(MaskEdit1,'75',0);
      DM.tmp.Close;
      DM.tmp.SQL.Text:='SELECT getdate()';
      DM.tmp.Open;
      DM.ADO122_1.Close;
      DM.ADO122_1.Parameters[0].Value:=-1;
      DM.ADO122_1.Open;
      DM.ADO122_1.Append;
      DM.ADO122_1.FieldByName('create_date').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
      DM.ADO122_1.FieldByName('coll_startdate').AsDateTime:=DM.ADO122.FieldByName('coll_startdate').AsDateTime;
      DM.ADO122_1.FieldByName('coll_enddate').AsDateTime:=DM.ADO122.FieldByName('coll_enddate').AsDateTime;
      SpeedButton1.Visible:=true;
      DM.ADO123_1.Parameters[0].Value:=DM.ADO122rkey.Value;
      DM.ADO123_1.Open;
    end;

    EdtCust.Enabled:=false;
    SpeedButton2.Enabled:=false;
    DBDateTimeEditEh1.Enabled:=false;
    DBDateTimeEditEh2.Enabled:=false;
    BtnOpen.Enabled:=false;
    if Ftag<>6 then
    begin
      MaskEdit1.Text:=DM.ADO122.Fieldbyname('comm_code').AsString;
      Edtsale.Text:=DM.ADO122REP_CODE.AsString;
      LBsale.Caption:=DM.ADO122SALES_REP_NAME.AsString;
      Edtsale.Tag:=DM.ADO122SALES_REP_PTR.AsInteger;
      DM.ADO122_1.Parameters[0].Value:=DM.ADO122rkey.Value;
      DM.ADO122_1.Open;
    end;
    Edtcust.Text:=DM.ADO122CUST_CODE.AsString;
    LBcust.Caption:=DM.ADO122CUSTOMER_NAME.AsString;
    Edtcust.Tag:=DM.ADO122customer_ptr.AsInteger;
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT SALES_DISCOUNT from data0010 where rkey='+DM.ADO122.FieldByName('customer_ptr').AsString;
    DM.tmp.Open;
    FSALES_DISCOUNT:=DM.tmp.Fields[0].AsFloat/100;
    
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT dbo.DATA0123.*, dbo.Data0114.REFERENCE_NO, dbo.Data0114.TDATE, dbo.Data0001.CURR_CODE '+
                     'FROM dbo.DATA0123 INNER JOIN '+
                     'dbo.Data0114 ON dbo.DATA0123.invoce_ptr = dbo.Data0114.RKEY INNER JOIN '+
                     'dbo.Data0001 ON dbo.Data0123.CURRENCY_PTR = dbo.Data0001.RKEY '+
                     'where dbo.DATA0123.comm_ptr='+DM.ADO122rkey.AsString+' order by Data0114.REFERENCE_NO';
    DM.tmp.Open;
    i:=1;
    while not DM.tmp.Eof do
    begin
      SGrid.Cells[0,i]:=DM.tmp.fieldbyname('REFERENCE_NO').AsString;  //'支票号';
      SGrid.Cells[1,i]:=DM.tmp.fieldbyname('TDATE').AsString;         //'收款日期';
      SGrid.Cells[2,i]:=DM.tmp.fieldbyname('CURR_CODE').AsString;     //'货币';
      SGrid.Cells[3,i]:=DM.tmp.fieldbyname('EXCH_RATE').AsString;     //'汇率';
      SGrid.Cells[4,i]:=DM.tmp.fieldbyname('pcb_type').AsString;     //'PCB类型';
      if DM.tmp.fieldbyname('discount_rate').AsString<>'0' then
        SGrid.Cells[5,i]:=DM.tmp.fieldbyname('discount_rate').AsString;    //'加权折率';
      if DM.tmp.fieldbyname('invoice_Amount').AsString<>'0' then
        SGrid.Cells[6,i]:=formatfloat('##0.00',DM.tmp.fieldbyname('invoice_Amount').AsFloat); //'收款金额';

      if DM.tmp.fieldbyname('va_tax').AsString<>'0' then
        SGrid.Cells[7,i]:=DM.tmp.fieldbyname('va_tax').AsString;     //扣税率
      if DM.tmp.fieldbyname('buckle_tax').AsString<>'0' then
        SGrid.Cells[8,i]:=DM.tmp.fieldbyname('buckle_tax').AsString;     //扣税
      if DM.tmp.fieldbyname('stick_breath').AsString<>'0' then
        SGrid.Cells[9,i]:=DM.tmp.fieldbyname('stick_breath').AsString;   //'贴息金额';
      if DM.tmp.fieldbyname('cust_comm').AsString<>'0' then
        SGrid.Cells[10,i]:=formatfloat('##0.00',DM.tmp.fieldbyname('cust_comm').AsFloat);//佣金
      if DM.tmp.fieldbyname('invt_craft').AsString<>'0' then
        SGrid.Cells[11,i]:=DM.tmp.fieldbyname('invt_craft').AsString;  //'材料工艺';
      if DM.tmp.fieldbyname('csc_amount').AsString<>'0' then
        SGrid.Cells[12,i]:=DM.tmp.fieldbyname('csc_amount').AsString;     //运费/报关

      if DM.tmp.fieldbyname('royalties_base').AsString<>'0' then
        SGrid.Cells[13,i]:=formatfloat('##0.00',DM.tmp.fieldbyname('royalties_base').AsFloat);  //'提成基数';
      if DM.tmp.fieldbyname('royalties_rate').AsString<>'0' then
        SGrid.Cells[14,i]:=DM.tmp.fieldbyname('royalties_rate').AsString;  //'提成比例';
      if DM.tmp.fieldbyname('bonus_rate').AsString<>'0' then
        SGrid.Cells[15,i]:=DM.tmp.fieldbyname('bonus_rate').AsString;  //'回款奖励';
      if DM.tmp.fieldbyname('royalties_Amount').AsString<>'0' then
        SGrid.Cells[16,i]:=formatfloat('##0.00',DM.tmp.fieldbyname('royalties_Amount').AsFloat);  //'提成金额';
      SGrid.Cells[17,i]:=DM.tmp.fieldbyname('invoce_ptr').AsString;          //'rkey114';
      SGrid.Cells[18,i]:=DM.tmp.fieldbyname('currency_ptr').AsString;        //rkey01
      SGrid.Cells[19,i]:=DM.tmp.fieldbyname('rkey').AsString;                //rkey123
      inc(i);
      DM.tmp.Next;
    end;
    SGrid.RowCount:=DM.tmp.RecordCount+2;
    DM.tmp.Close;
    DM.ADO124.Parameters[0].Value:=DM.ADO122rkey.AsInteger;
    DM.ADO124.Open;
  end;

  EdtKK.Text:=floattostr(DM.FsumKK);
  DM.FEdtKKEvt:=sumKK;
  sumTC;

  if Ftag<>2 then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select ltrim(rtrim(category)) category from data0061';
    DM.tmp.Open;
    DM.FrecNm:=[];
    while not DM.tmp.Eof do
    begin
      if DM.ADO124.Locate('category',trim(DM.tmp.Fields[0].asstring),[]) then
        DM.FrecNm:=DM.FrecNm+[DM.ADO124.RecNo];
      DM.tmp.Next;
    end;
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select distinct pcb_type from data0125';
    DM.tmp.Open;
    while not DM.tmp.Eof do
    begin
      ComboBox1.Items.Append(DM.tmp.Fields[0].asstring);
      DM.tmp.Next;
    end;
    DM.tmp.Close;
    Fx:=3;Fy:=1;
  end;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var i:integer;
begin
  if (ftag=0) and DM.DtChanged then
  begin
    showmessage('您的收款期间已变更,但收款记录未刷新...');
    exit;
  end;
  if Ftag=0 then MaskEdit1.SetFocus;
  if MaskEdit1.Text='' then
  begin
    showmessage('提成单号不能为空...');
    exit;
  end;
  if EdtSale.Text='' then
  begin
    showmessage('业务员不能为空...');
    exit;
  end;
  if FinValid then exit;

 { if SGrid.RowCount=2 then
  begin
    showmessage('收款项不能为空...');
    exit;
  end;
  }
  if Ftag in [0,6] then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select top 1 comm_code rkey from data0122 where' +
                     ' customer_ptr='+inttostr(Edtcust.Tag)+
                     ' and SALES_REP_PTR='+inttostr(Edtsale.Tag)+
                     ' and ((coll_startdate between '''+DM.ADO122_1.fieldbyname('coll_startdate').AsString+''' and '''+DM.ADO122_1.fieldbyname('coll_startdate').AsString+
                     ''') or (coll_enddate between '''+DM.ADO122_1.fieldbyname('coll_startdate').AsString+''' and '''+DM.ADO122_1.fieldbyname('coll_startdate').AsString+'''))';

    DM.tmp.Open;
    if not DM.tmp.IsEmpty then
    begin
      showmessage('提成单号:'+DM.tmp.Fields[0].asstring+'与此提成单的的区间相交叉,'+#13+'业务员不能对同一客户同时期提成多次,不能保存...');
      exit;
    end;
  end;
  sumTC;

  if FisValid then
  begin
    FisValid:=false;
    showmessage('注意:有提成金额为负的记录,请修改后保存...');
    exit;
  end;

 { if  DM.ADO122_1.FieldByName('commission').AsFloat<0 then
  begin
    FisValid:=false;
    showmessage('注意:提成金额不能为负,请修改后保存...');
    exit;
  end;
  }
  DM.ADOCon.BeginTrans;
  if ((Ftag=0) or (Ftag=6)) and not DM.GetNo(MaskEdit1,'75',1) then abort;
  DM.ADO122_1.Edit;
  DM.ADO122_1.FieldByName('comm_code').AsString:=MaskEdit1.Text;
  DM.ADO122_1.FieldByName('customer_ptr').AsInteger:=EdtCust.Tag;
  DM.ADO122_1.FieldByName('sales_rep_ptr').AsInteger:=Edtsale.Tag;
  DM.ADO122_1.FieldByName('create_empl_ptr').AsString:=user_ptr;
  DM.ADO122_1.Post;
  try
    DM.ADO122_1.UpdateBatch(arAll);
    if (Ftag=0) or (Ftag=6) then
    begin
      DM.ADO123_1.Close;
      DM.ADO123_1.Parameters[0].Value:=-1;
      DM.ADO123_1.Open;

      if DM.ADO126.Active and not DM.ADO126.IsEmpty then
      begin
        DM.ADO126.First;
        while not Frm_YCB.ADO53_1.Eof do
        begin
          DM.ADO126.Edit;
          DM.ADO126.FieldByName('rkey122').AsInteger:=DM.ADO122_1.FieldByName('rkey').AsInteger;
          DM.ADO126.Post;
          DM.ADO126.Next;
        end;
      end;
    end else begin //Edit
      for i:=1 to DM.ADO123_1.RecordCount do DM.ADO123_1.Delete;  //若原纪录其他人有改动,提交时会不成功
      if DM.ADO126.Active or (DM.ADO124.Locate('CATEGORY','异常板成本',[]) and (DM.ADO124SHARE_base.Value=0))  then //126有变动,清除原记录
      begin
        DM.Tmp.Close;
        DM.Tmp.SQL.Text:='delete from data0126 where rkey122='+DM.ADO122_1.FieldByName('rkey').AsString;
        DM.Tmp.ExecSQL;
      end;
    end;

    for i:=1 to SGrid.RowCount-2 do
    begin
      DM.ADO123_1.Append;
      DM.ADO123_1.FieldByName('comm_ptr').AsInteger:=DM.ADO122_1.FieldByName('rkey').AsInteger;
      DM.ADO123_1.FieldByName('invoce_ptr').AsString:=SGrid.Cells[17,i];
      DM.ADO123_1.FieldByName('currency_ptr').AsString:=SGrid.Cells[18,i];
      DM.ADO123_1.FieldByName('exch_rate').AsString:='0'+trim(SGrid.Cells[3,i]);
      DM.ADO123_1.FieldByName('pcb_type').AsString:=trim(SGrid.Cells[4,i]);
      DM.ADO123_1.FieldByName('discount_rate').AsString:='0'+trim(SGrid.Cells[5,i]);
      DM.ADO123_1.FieldByName('invoice_Amount').AsString:='0'+trim(SGrid.Cells[6,i]);
      DM.ADO123_1.FieldByName('va_tax').AsString:='0'+trim(SGrid.Cells[7,i]); //税率
      DM.ADO123_1.FieldByName('buckle_tax').AsString:='0'+trim(SGrid.Cells[8,i]);
      DM.ADO123_1.FieldByName('stick_breath').AsString:='0'+trim(SGrid.Cells[9,i]);
      DM.ADO123_1.FieldByName('cust_comm').AsString:='0'+trim(SGrid.Cells[10,i]);
      DM.ADO123_1.FieldByName('invt_craft').AsString:='0'+trim(SGrid.Cells[11,i]);
      DM.ADO123_1.FieldByName('csc_amount').AsString:='0'+trim(SGrid.Cells[12,i]); //运费/报关
      DM.ADO123_1.FieldByName('royalties_base').AsString:=trim(SGrid.Cells[13,i]);
      DM.ADO123_1.FieldByName('royalties_rate').AsString:='0'+trim(SGrid.Cells[14,i]);
      DM.ADO123_1.FieldByName('bonus_rate').AsString:='0'+trim(SGrid.Cells[15,i]);
      DM.ADO123_1.FieldByName('royalties_Amount').AsString:='0'+trim(SGrid.Cells[16,i]);
      DM.ADO123_1.Post;
    end;
    DM.ADO123_1.UpdateBatch(arAll);
    if not DBGridEh1.ReadOnly then
    begin
       DM.Tmp.Close;
       DM.Tmp.SQL.Text:='delete from data0124 where comm_ptr='+DM.ADO122_1.FieldByName('rkey').AsString;
       DM.Tmp.ExecSQL;
       DM.ADO124.First;
       while not DM.ADO124.Eof do
       begin
         if DM.ADO124SHARE_amount.AsCurrency>0 then
         begin
           DM.Tmp.SQL.Text:='insert into data0124 (comm_ptr,category_ptr,share_base,share_scale,share_amount) values('+
                          DM.ADO122_1.FieldByName('rkey').AsString+','+DM.ADO124.FieldByName('rkey').AsString+','+
                          DM.ADO124SHARE_base.AsString+','+DM.ADO124shareScale.AsString+','+DM.ADO124SHARE_amount.AsString+')';
           DM.Tmp.ExecSQL;
         end;
         DM.ADO124.Next;
       end;
    end;

    if DM.ADO126.Active and not DM.ADO126.IsEmpty then DM.ADO126.UpdateBatch(arAll);
    
    DM.ADOCon.CommitTrans;
    Frkey122:=DM.ADO122_1.FieldByName('rkey').AsInteger;
    modalresult:=mrok;
  except
    on E: Exception do
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('数据保存发生错误:'+E.Message);
    end;
  end;
end;

procedure TFrm_detail.EdtCustEnter(Sender: TObject);
begin
  FCust:=EdtCust.Text;
end;

procedure TFrm_detail.EdtCustExit(Sender: TObject);
var i:integer;
     scust:string;
begin
  if (FCust<>EdtCust.Text) and (EdtCust.Text<>'') then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT rkey,CUST_CODE, CUSTOMER_NAME, SALES_DISCOUNT from Data0010 where CUST_CODE='''+Edtcust.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('客户代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      Edtcust.SetFocus;
      FCust:='';
      FinValid:=true;
      abort;
    end else begin
      EdtCust.Text:=DM.tmp.FieldValues['CUST_CODE'];
      LBCust.Caption:=DM.tmp.FieldValues['CUSTOMER_NAME'];
      EdtCust.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      FSALES_DISCOUNT:=DM.tmp.Fieldbyname('SALES_DISCOUNT').AsFloat/100;
      scust:=DM.tmp.Fieldbyname('rkey').AsString;

      DM.tmp.Close;
      DM.tmp.SQL.Text:='SELECT top 1 dbo.Data0009.RKEY, dbo.Data0009.REP_CODE, dbo.Data0009.SALES_REP_NAME '+
                        'FROM dbo.Data0009 INNER JOIN '+
                        'dbo.Data0012 ON dbo.Data0009.RKEY = dbo.Data0012.SREP_PTR_1 '+
                        'WHERE dbo.Data0012.CUSTOMER_PTR = '+scust;
      DM.tmp.Open;
      EdtSale.Text:=DM.tmp.Fieldbyname('REP_CODE').AsString;
      LBSale.Caption:=DM.tmp.Fieldbyname('SALES_REP_NAME').AsString;
      EdtSale.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      DM.tmp.Close;

      FinValid:=false;
      SGrid.RowCount:=2;
      for i:=0 to SGrid.ColCount-1 do SGrid.Cells[i,1]:='';
      DM.coll_startdateChange(nil);
    end;
  end;
end;

procedure TFrm_detail.SpeedButton2Click(Sender: TObject);
  var InputVar: PDlgInput ;
              i:integer;

begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'CUST_CODE/客户代码/200,CUSTOMER_NAME/客户名称/250';
      InputVar.Sqlstr :='SELECT rkey,CUST_CODE, CUSTOMER_NAME, SALES_DISCOUNT from data0010 order by 2';
      inputvar.KeyField:='CUST_CODE';
      InputVar.InPut_value:=Edtcust.Text;
    end;
    1:
    begin
      InputVar.Fields := 'rep_CODE/业务员代码/200,SALES_REP_NAME/业务员名称/250';
      InputVar.Sqlstr :='declare @CUSTOMER_PTR int,@rkey09 int '+
                        'select @CUSTOMER_PTR='+DM.ADO122.fieldbyname('CUSTOMER_PTR').AsString+',@rkey09='+DM.ADO122.fieldbyname('SALES_REP_PTR').AsString+
                        ' SELECT  dbo.Data0009.RKEY, dbo.Data0009.REP_CODE, dbo.Data0009.SALES_REP_NAME '+
                        'FROM  dbo.Data0009 INNER JOIN '+
                        'dbo.Data0012 ON dbo.Data0009.RKEY = dbo.Data0012.SREP_PTR_1 '+
                        'WHERE (dbo.Data0012.CUSTOMER_PTR = @CUSTOMER_PTR) and dbo.Data0009.RKEY<>@rkey09 '+
                        'union all '+
                        'SELECT dbo.Data0009.RKEY, dbo.Data0009.REP_CODE, dbo.Data0009.SALES_REP_NAME '+
                        'FROM dbo.Data0009 INNER JOIN '+
                        'dbo.Data0012 ON dbo.Data0009.RKEY = dbo.Data0012.SREP_PTR_2 '+
                        'WHERE (dbo.Data0012.CUSTOMER_PTR = @CUSTOMER_PTR) and dbo.Data0009.RKEY<>@rkey09 '+
                        'union all '+
                        'SELECT dbo.Data0009.RKEY, dbo.Data0009.REP_CODE, dbo.Data0009.SALES_REP_NAME '+
                        'FROM dbo.Data0009 INNER JOIN '+
                        'dbo.Data0012 ON dbo.Data0009.RKEY = dbo.Data0012.SREP_PTR_3 '+
                        'WHERE (dbo.Data0012.CUSTOMER_PTR = @CUSTOMER_PTR) and dbo.Data0009.RKEY<>@rkey09 '+
                        'union all '+
                        'SELECT dbo.Data0009.RKEY, dbo.Data0009.REP_CODE, dbo.Data0009.SALES_REP_NAME '+
                        'FROM dbo.Data0009 INNER JOIN '+
                        'dbo.Data0012 ON dbo.Data0009.RKEY = dbo.Data0012.SREP_PTR_4 '+
                        'WHERE (dbo.Data0012.CUSTOMER_PTR = @CUSTOMER_PTR) and dbo.Data0009.RKEY<>@rkey09 '+
                        'union all '+
                        'SELECT dbo.Data0009.RKEY, dbo.Data0009.REP_CODE, dbo.Data0009.SALES_REP_NAME '+
                        'FROM dbo.Data0009 INNER JOIN '+
                        'dbo.Data0012 ON dbo.Data0009.RKEY = dbo.Data0012.SREP_PTR_5 '+
                        'WHERE (dbo.Data0012.CUSTOMER_PTR = @CUSTOMER_PTR) and dbo.Data0009.RKEY<>@rkey09 '+
                        'order by dbo.Data0009.REP_CODE ';

      inputvar.KeyField:='rep_CODE';
      InputVar.InPut_value:=Edtsale.Text;
    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         EdtCust.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_CODE']);
         LBCust.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['CUSTOMER_NAME']);
         EdtCust.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         DM.tmp.Close;
         DM.tmp.SQL.Text:='SELECT top 1 dbo.Data0009.RKEY, dbo.Data0009.REP_CODE, dbo.Data0009.SALES_REP_NAME '+
                          'FROM dbo.Data0009 INNER JOIN '+
                          'dbo.Data0012 ON dbo.Data0009.RKEY = dbo.Data0012.SREP_PTR_1 '+
                          'WHERE dbo.Data0012.CUSTOMER_PTR = '+frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
         DM.tmp.Open;
         EdtSale.Text:=DM.tmp.Fieldbyname('REP_CODE').AsString;
         LBSale.Caption:=DM.tmp.Fieldbyname('SALES_REP_NAME').AsString;
         EdtSale.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
         DM.tmp.Close;

         FSALES_DISCOUNT:=frmPick_Item_Single.adsPick.Fieldbyname('SALES_DISCOUNT').AsFloat/100;
         DBDateTimeEditEh1.SetFocus;
         SGrid.RowCount:=2;
         for i:=0 to SGrid.ColCount-1 do SGrid.Cells[i,1]:='';
         DM.coll_startdateChange(nil);
       end;
     1:begin
         Edtsale.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['rep_CODE']);
         LBsale.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['SALES_REP_NAME']);
         Edtsale.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) and not (self.ActiveControl is TStringGrid) and not (self.ActiveControl is TDBMemo) then
    self.SelectNext(self.ActiveControl,true,true)
  else if (key=vk_return) and (self.ActiveControl is TStringGrid) then
    postmessage(self.ActiveControl.Handle,wm_keydown,vk_tab,0);
end;


procedure TFrm_detail.SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  CellString : string;
begin
  CellString := SGrid.Cells[ACol,ARow];
  if (ACol in [6,8,10,13,16]) and (ARow>0) and (ARow<SGrid.RowCount-1) then
  begin
    SGrid.Canvas.Brush.Color:=$00EEF1F2;
    SGrid.Canvas.FillRect(Rect);
    //SGrid.Canvas.Font.Color:=clblack;
   // Canvas.TextRect(rect,rect.Left+4,rect.top+4,CellString);
  end;

  if  ARow=0 then
    SGrid.Canvas.TextRect(rect,rect.left+(rect.right-rect.left-SGrid.Canvas.TextWidth(CellString)) div 2,
                               rect.top+(rect.bottom-rect.top-SGrid.Canvas.TextHeight(CellString)) div 2,CellString)
  else if (ARow>0) and (ACol in [5..16]) then    //数字居右
    SGrid.Canvas.TextRect(rect,rect.left+(rect.right-rect.left-SGrid.Canvas.TextWidth(CellString)),
                               rect.top+(rect.bottom-rect.top-SGrid.Canvas.TextHeight(CellString)) div 2,CellString);
end;

procedure TFrm_detail.SGridKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ftag=2) then abort;
  if (sGrid.Col in [3,5,7,9,11,12,14,15]) then
     if not (key in ['0'..'9','.',#8]) or ((key='.') and (pos('.',sGrid.Cells[sGrid.col,SGrid.Row])>0)) then abort;
end;

procedure TFrm_detail.SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var i:integer;
    R:TRect;
begin
  if (Ftag=2) or (SGrid.RowCount=2) then exit;
  ComboBox1.Visible:=false;

  if  strtofloat('0'+SGrid.Cells[Fx,Fy])=0  then SGrid.Cells[Fx,Fy]:='1';
  if Acol=3 then
  begin
    Fx:=ACol;Fy:=ARow;
    Fexchg:=strtofloat('0'+SGrid.Cells[3, ARow]);
    Fsk:=strtofloat('0'+SGrid.Cells[6, ARow]);
  end;

  if (ARow<>SGrid.RowCount-1) and ((ACol in [5,7,9,11,12,14,15]) or ((Acol=3) and (SGrid.Cells[2, ARow]<>'RMB')))  then
    sGrid.Options:=sGrid.Options+[goEditing]
  else
    sGrid.Options:=sGrid.Options-[goEditing];

  if (Ftag<>2) and (ARow<>SGrid.RowCount-1) and (ACol=4)  then
  begin
    R:=sGrid.CellRect(Acol,Arow);
    ComboBox1.Left:=R.Left+1;
    ComboBox1.Top:=R.Top+1;
    
    if SGrid.Cells[ACol, ARow]='' then
       ComboBox1.ItemIndex:=-1
    else for i:=0 to ComboBox1.Items.Count-1 do
      if ComboBox1.Items[i]=SGrid.Cells[ACol, ARow] then ComboBox1.ItemIndex:=i;
    ComboBox1.Visible:=true;
  end;
end;

procedure TFrm_detail.ComboBox1Exit(Sender: TObject);
var k:word;
begin
  SGrid.Cells[SGrid.Col, SGrid.Row]:=ComboBox1.Text;
  getTCRate(SGrid.Cells[4,SGrid.Row],SGrid.Cells[5,SGrid.Row]);
  SGridKeyUp(nil,k,[]);
end;

procedure TFrm_detail.SGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ftag=2 then abort;
  if (sGrid.col=5) and (strtofloat('0'+trim(SGrid.Cells[5,SGrid.Row]))>500) then
  begin
    SGrid.Cells[sGrid.col,SGrid.Row]:=copy(SGrid.Cells[sGrid.col,SGrid.Row],1,length(SGrid.Cells[sGrid.col,SGrid.Row])-1);
    abort;
  end else if (sGrid.col=7) and (strtofloat('0'+trim(SGrid.Cells[sGrid.col,SGrid.Row]))>18) then
  begin
    SGrid.Cells[sGrid.col,SGrid.Row]:=copy(SGrid.Cells[sGrid.col,SGrid.Row],1,length(SGrid.Cells[sGrid.col,SGrid.Row])-1);
    abort;
  end else if (sGrid.col=14) and (strtofloat('0'+trim(SGrid.Cells[sGrid.col,SGrid.Row]))>30) then
  begin
    SGrid.Cells[sGrid.col,SGrid.Row]:=copy(SGrid.Cells[sGrid.col,SGrid.Row],1,length(SGrid.Cells[sGrid.col,SGrid.Row])-1);
    abort;
  end else if (sGrid.col=15) and (strtofloat('0'+trim(SGrid.Cells[sGrid.col,SGrid.Row]))>2) then
  begin
    SGrid.Cells[sGrid.col,SGrid.Row]:=copy(SGrid.Cells[sGrid.col,SGrid.Row],1,length(SGrid.Cells[sGrid.col,SGrid.Row])-1);
    abort;
  end;
  if sGrid.col in [3,4,5,7,9,11,12,14,15] then
  begin
     if (sGrid.col<>4) and (sGrid.col<>15) and (strtofloat('0'+trim(SGrid.Cells[sGrid.col,SGrid.Row]))>=strtofloat('0'+trim(SGrid.Cells[6,SGrid.Row]))) then
     begin
       SGrid.Cells[sGrid.col,SGrid.Row]:=copy(SGrid.Cells[sGrid.col,SGrid.Row],1,length(SGrid.Cells[sGrid.col,SGrid.Row])-1);
       abort;
     end ;

     if (sGrid.col=3) and (strtofloat('0'+trim(SGrid.Cells[3,SGrid.Row]))>0) then
       SGrid.Cells[6,SGrid.Row]:=formatfloat('##0.00',Fsk*strtofloat('0'+trim(SGrid.Cells[3,SGrid.Row]))/Fexchg)
     else if (sGrid.col=3) and (strtofloat('0'+trim(SGrid.Cells[3,SGrid.Row]))=0) then
       SGrid.Cells[6,SGrid.Row]:=formatfloat('##0.00',Fsk/Fexchg);

     if sGrid.col=5 then getTCRate(SGrid.Cells[4,SGrid.Row],SGrid.Cells[5,SGrid.Row]);
     if sGrid.col=7 then SGrid.Cells[8,SGrid.Row]:=formatfloat('##0.00',strtofloat('0'+trim(SGrid.Cells[6,SGrid.Row]))/100*strtofloat('0'+trim(SGrid.Cells[7,SGrid.Row]))/(1+strtofloat('0'+trim(SGrid.Cells[7,SGrid.Row]))/100));

     SGrid.Cells[13,SGrid.Row]:=formatfloat('##0.00',strtofloat('0'+trim(SGrid.Cells[6,SGrid.Row]))-
                                                     strtofloat('0'+trim(SGrid.Cells[8,SGrid.Row]))-
                                                     strtofloat('0'+trim(SGrid.Cells[9,SGrid.Row]))-
                                                     strtofloat('0'+trim(SGrid.Cells[10,SGrid.Row]))-
                                                     strtofloat('0'+trim(SGrid.Cells[11,SGrid.Row]))-
                                                     strtofloat('0'+trim(SGrid.Cells[12,SGrid.Row])));  //'提成基数';
     SGrid.Cells[16,SGrid.Row]:=formatfloat('##0.00',strtofloat(trim(SGrid.Cells[13,SGrid.Row]))*(strtofloat('0'+trim(SGrid.Cells[14,SGrid.Row]))+strtofloat('0'+trim(SGrid.Cells[15,SGrid.Row])))/100);  //'提成金额';
     sumTC;
  end;
end;

procedure TFrm_detail.N1Click(Sender: TObject);
var i,j:integer;
begin
  if strtofloat(SGrid.Cells[13,SGrid.Row])<=0 then begin showmessage('提成基数为负,数据错误...');exit;end;
  Frm_CF:=TFrm_CF.Create(nil);
  try
    Frm_CF.Edit1.Text:=SGrid.Cells[0,SGrid.Row];
    Frm_CF.Edit2.Text:=SGrid.Cells[1,SGrid.Row];
    Frm_CF.Edit3.Text:=SGrid.Cells[6,SGrid.Row];
    Frm_CF.Edit5.Text:=SGrid.Cells[13,SGrid.Row];
    if Frm_CF.ShowModal=mrok then
    begin
      for i:=SGrid.RowCount-1 downto SGrid.Row+1 do
        for j:=0 to SGrid.ColCount-1 do
          SGrid.Cells[j,i]:=SGrid.Cells[j,i-1];

      SGrid.Cells[4,i+1]:='';
      SGrid.Cells[6,i+1]:=formatfloat('##0.00',strtofloat(Frm_CF.Edit4.Text));
      SGrid.Cells[7,i+1]:='';
      SGrid.Cells[8,i+1]:='';
      SGrid.Cells[9,i+1]:='';
      SGrid.Cells[10,i+1]:=formatfloat('##0.00',strtofloat(Frm_CF.Edit4.Text)*FSALES_DISCOUNT);
      SGrid.Cells[11,i+1]:='';
      SGrid.Cells[12,i+1]:='';

      SGrid.Cells[13,i+1]:=formatfloat('##0.00',strtofloat(Frm_CF.Edit4.Text)*(1-FSALES_DISCOUNT));
      SGrid.Cells[14,i+1]:='';
      SGrid.Cells[15,i+1]:='';
      SGrid.Cells[16,i+1]:='';

      SGrid.Cells[6,SGrid.Row]:=formatfloat('##0.00',strtofloat('0'+trim(SGrid.Cells[6,SGrid.Row]))-strtofloat(Frm_CF.Edit4.Text));
      SGrid.Cells[8,SGrid.Row]:=formatfloat('##0.00',strtofloat('0'+trim(SGrid.Cells[6,SGrid.Row]))/100*strtofloat('0'+trim(SGrid.Cells[7,SGrid.Row]))/(1+strtofloat('0'+trim(SGrid.Cells[7,SGrid.Row]))/100));
      SGrid.Cells[10,SGrid.Row]:=formatfloat('##0.00',strtofloat('0'+trim(SGrid.Cells[6,SGrid.Row]))*FSALES_DISCOUNT);
      SGrid.Cells[13,SGrid.Row]:=formatfloat('##0.00',strtofloat('0'+trim(SGrid.Cells[6,SGrid.Row]))-
                                                      strtofloat('0'+trim(SGrid.Cells[8,SGrid.Row]))-
                                                      strtofloat('0'+trim(SGrid.Cells[9,SGrid.Row]))-
                                                      strtofloat('0'+trim(SGrid.Cells[10,SGrid.Row]))-
                                                      strtofloat('0'+trim(SGrid.Cells[11,SGrid.Row]))-
                                                      strtofloat('0'+trim(SGrid.Cells[12,SGrid.Row])));  //'提成基数';
      SGrid.Cells[16,SGrid.Row]:=formatfloat('##0.00',strtofloat(trim(SGrid.Cells[13,SGrid.Row]))*(strtofloat('0'+trim(SGrid.Cells[14,SGrid.Row]))+strtofloat('0'+trim(SGrid.Cells[15,SGrid.Row])))/100);
      SGrid.RowCount:=SGrid.RowCount+1;
      for j:=0 to SGrid.ColCount-1 do SGrid.Cells[j,SGrid.RowCount-1]:='';
      sumTC;
    end;
  finally
    Frm_CF.Free;
  end;
end;

procedure TFrm_detail.N2Click(Sender: TObject);
var i,j,k:integer;
    b:boolean;
begin
  for i:=1 to SGrid.Row-1 do
    if SGrid.Cells[17,i]=SGrid.Cells[17,SGrid.Row] then
    begin
      b:=true;
      SGrid.Cells[6,i]:=formatfloat('##0.00',strtofloat('0'+trim(SGrid.Cells[6,SGrid.Row]))+strtofloat('0'+trim(SGrid.Cells[6,i])));
      SGrid.Cells[8,i]:=formatfloat('##0.00',strtofloat('0'+trim(SGrid.Cells[6,i]))/100*strtofloat('0'+trim(SGrid.Cells[7,i]))/(1+strtofloat('0'+trim(SGrid.Cells[7,i]))/100));
      SGrid.Cells[10,i]:=formatfloat('##0.00',strtofloat('0'+trim(SGrid.Cells[6,i]))*FSALES_DISCOUNT);
      SGrid.Cells[13,i]:=formatfloat('##0.00',strtofloat('0'+trim(SGrid.Cells[6,i]))-
                                              strtofloat('0'+trim(SGrid.Cells[8,i]))-
                                              strtofloat('0'+trim(SGrid.Cells[9,i]))-
                                              strtofloat('0'+trim(SGrid.Cells[10,i]))-
                                              strtofloat('0'+trim(SGrid.Cells[11,i]))-
                                              strtofloat('0'+trim(SGrid.Cells[12,i])));  //'提成基数';
      SGrid.Cells[16,i]:=formatfloat('##0.00',strtofloat('0'+trim(SGrid.Cells[13,i]))*(strtofloat('0'+trim(SGrid.Cells[14,i]))+strtofloat('0'+trim(SGrid.Cells[15,i])))/100);

      for k:=SGrid.Row to SGrid.ColCount-2 do
        for j:=0 to SGrid.ColCount-1 do SGrid.Cells[j,k]:=SGrid.Cells[j,k+1];

      SGrid.RowCount:=SGrid.RowCount-1;
      sumTC;
      break;
    end;
  if not b then showmessage('未找到被拆分的母单,不能删除此行...');
end;

procedure TFrm_detail.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if DM.ADO124.RecNo in DM.FrecNm then
     DBGridEh1.Canvas.Brush.Color := clBtnFace
  else if (DataCol<>2) or (DM.ADO124.RecNo in DM.FrecNm) then
     DBGridEh1.Canvas.Brush.Color := $00D3CEC9;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_detail.BtnOpenClick(Sender: TObject);
var i:integer;

begin
  if EdtCust.Text='' then
  begin
    showmessage('请先输入收款客户...');
    EdtCust.SetFocus;
    exit;
  end;
  if Edtsale.Text='' then
  begin
    showmessage('请先输入业务员...');
    Edtsale.SetFocus;
    exit;
  end;
  if (SGrid.RowCount>2) and (MessageBox(Handle,'将会删除原有已编辑的收款项,重新得到新的'+#13+'收款记录, 确定重新打开吗?','重新打开收款提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;

  DM.ADO123.Close;
  DM.ADO123.Parameters[0].Value:=DBDateTimeEditEh1.Field.AsDateTime;
  DM.ADO123.Parameters[1].Value:=DBDateTimeEditEh2.Field.AsDateTime;
  DM.ADO123.Parameters[2].Value:=EdtCust.Tag;
  DM.ADO123.Parameters[3].Value:=DM.ADO123.Parameters[0].Value;
  DM.ADO123.Parameters[4].Value:=DM.ADO123.Parameters[1].Value;
  DM.ADO123.Parameters[5].Value:=EdtCust.Tag;                        //以前提成过,不能重复提成
  if Ftag=0 then
    DM.ADO123.Parameters[6].Value:=-1
  else
    DM.ADO123.Parameters[6].Value:=DM.ADO122rkey.AsInteger;
  DM.ADO123.Open;
  if DM.ADO123.IsEmpty then
  begin
    SGrid.RowCount:=2;
    for i:=0 to SGrid.ColCount-1 do SGrid.Cells[i,SGrid.RowCount-1]:='';
    showmessage('此客户在此期间没有收款记录...')
  end else begin
    i:=1;
    while not DM.ADO123.Eof do
    begin
      if  DM.ADO123.fieldbyname('Amount_a').AsFloat<=0 then  //以扣款抵收款
      begin
        DM.ADO123.Next;
        continue;
      end;
      SGrid.Cells[0,i]:=DM.ADO123.fieldbyname('REFERENCE_NO').AsString;//'支票号';
      SGrid.Cells[1,i]:=DM.ADO123.fieldbyname('TDATE').AsString;         //'收款日期';
      SGrid.Cells[2,i]:=DM.ADO123.fieldbyname('CURR_CODE').AsString;     //'货币';
      SGrid.Cells[3,i]:=DM.ADO123.fieldbyname('EXCHANGE_RATE').AsString; //'汇率';
      SGrid.Cells[4,i]:='';                                               //'PCB类型';
      SGrid.Cells[5,i]:='';                                              //'加权折率';
      SGrid.Cells[6,i]:=formatfloat('##0.00',DM.ADO123.fieldbyname('Amount_a').AsFloat*DM.ADO123.fieldbyname('EXCHANGE_RATE').AsFloat);       //'收款金额';
      SGrid.Cells[7,i]:='';   //扣税率
      SGrid.Cells[8,i]:='';   //扣税
      SGrid.Cells[9,i]:='';   //'贴息金额';
      SGrid.Cells[10,i]:=formatfloat('##0.00',DM.ADO123.fieldbyname('Amount_a').AsFloat*DM.ADO123.fieldbyname('EXCHANGE_RATE').AsFloat*FSALES_DISCOUNT);//佣金
      SGrid.Cells[11,i]:='';  //'材料工艺';
      SGrid.Cells[12,i]:='';   //运费/报关
      SGrid.Cells[13,i]:=formatfloat('##0.00',DM.ADO123.fieldbyname('Amount_a').AsFloat*DM.ADO123.fieldbyname('EXCHANGE_RATE').AsFloat*(1-FSALES_DISCOUNT));  //'提成基数';
      SGrid.Cells[14,i]:='';  //'提成比例';
      SGrid.Cells[15,i]:='';  //回款奖励;
      SGrid.Cells[16,i]:='';  //'提成金额';
      SGrid.Cells[17,i]:=DM.ADO123.fieldbyname('rkey').AsString; //'rkey114';
      SGrid.Cells[18,i]:=DM.ADO123.fieldbyname('rkey01').AsString; //rkey01
      SGrid.Cells[19,i]:=''; //rkey123
      inc(i);
      DM.ADO123.Next;
    end;
    SGrid.RowCount:=i+1;
    DM.ADO123.Close;
    for i:=0 to SGrid.ColCount-1 do SGrid.Cells[i,SGrid.RowCount-1]:='';

    DM.FEdt:=true;
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT dbo.Data0061.CATEGORY, SUM(dbo.Data0062.costfree_amount+dbo.Data0062.FREE_AMOUNT) AS cf_amount '+
                     'FROM dbo.Data0062 INNER JOIN '+
                     'dbo.Data0060 ON dbo.Data0062.SO_PTR = dbo.Data0060.RKEY INNER JOIN '+
                     'dbo.Data0061 ON dbo.Data0062.ADDL_CAT_PTR = dbo.Data0061.RKEY '+
                     'WHERE (dbo.Data0060.CUSTOMER_PTR = '+inttostr(EdtCust.Tag)+') AND '+
                     '(dbo.Data0060.ENT_DATE >='''+DBDateTimeEditEh1.Field.AsString+''') AND '+
                     '(dbo.Data0060.ENT_DATE-1<'''+DBDateTimeEditEh2.Field.AsString+''') '+
                     'GROUP BY dbo.Data0061.CATEGORY ';
                    // 'HAVING (SUM(dbo.Data0062.costfree_amount + dbo.Data0062.FREE_AMOUNT)>0)';

    DM.tmp.Open;
    while not DM.tmp.Eof do
    begin
      if DM.ADO124.Locate('CATEGORY',trim(DM.tmp.Fields[0].asstring),[]) then
      begin
        DM.ADO124.Edit;
        DM.ADO124SHARE_base.AsFloat:=DM.tmp.Fields[1].AsFloat;
        DM.ADO124.Post;
      end;
      DM.tmp.Next;
    end;
    DM.tmp.Close;
    DM.FEdt:=false;
    DM.DtChanged:=false;
  end;
end;

procedure TFrm_detail.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=(SGrid.RowCount>2) and (SGrid.Row<>SGrid.RowCount-1);
  N2.Enabled:=N1.Enabled;
  N3.Enabled:=N1.Enabled;
  N5.Enabled:=N1.Enabled;
end;

procedure TFrm_detail.SGridTopLeftChanged(Sender: TObject);
begin
  ComboBox1.Visible:=false;
end;

procedure TFrm_detail.N3Click(Sender: TObject);
var
    sD1,sD2:Tdate;
    k:word;
begin
  getdate(sD1,sD2);
  with TForm_discountrate.Create(nil) do
  try
    ads114.Parameters[0].Value:=strtoint(self.SGrid.Cells[17,self.SGrid.Row]);
    ads114.Parameters[1].Value:=strtoint(self.SGrid.Cells[17,self.SGrid.Row]);
    ads114.Open;
    ads64.Parameters[0].Value:=sD1;
    ads64.Parameters[1].Value:=sD2;
    ads64.Parameters[2].Value:=EdtCust.Tag;
    ads64.Open;
    if showmodal=mrok then
    begin
      self.SGrid.Cells[5,self.SGrid.Row]:=Edit1.Text;
      getTCRate(ComboBox1.Text,SGrid.Cells[5,SGrid.Row]);
      SGridKeyUp(nil,k,[]);
    end;
  finally
    free;
  end;
end;

procedure TFrm_detail.getdate(var D1, D2: Tdate);
var Y,M,D:word;
begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select getdate()';
  DM.tmp.Open;
  DecodeDate(DM.tmp.Fields[0].AsDateTime,Y,M,D);
  DM.tmp.Close;
  if M=1 then
  begin
    Y:=Y-1;M:=12;D:=31;
  end else
    DecodeDate(EncodeDate(Y,M,1)-1,Y,M,D);
  D1:=EncodeDate(Y,M,1);
  D2:=EncodeDate(Y,M,D);
end;

procedure TFrm_detail.sumTC;
var i:integer;
    v:real;
begin
  v:=0;
  for i:=1 to SGrid.RowCount-2 do
    if trim(SGrid.Cells[16,i])<>'' then
    begin
      v:=v+strtofloat(trim(SGrid.Cells[16,i]));
      if strtofloat(trim(SGrid.Cells[16,i]))<0 then FisValid:=true;
    end;
  EdtTC.Text:=floattostr(V);
  if Ftag<>2 then
  begin
    DM.ADO122_1.Edit;
    DM.ADO122_1.FieldByName('commission').AsFloat:=v-strtofloat(EdtKK.Text);
  end;
end;

procedure TFrm_detail.sumKK;
begin
  EdtKK.Text:=floattostr(DM.FsumKK);
  if Ftag<>2 then
  begin
    DM.ADO122_1.Edit;
    DM.ADO122_1.FieldByName('commission').AsFloat:=strtofloat(EdtTC.Text)-strtofloat(EdtKK.Text);
  end;
end;


procedure TFrm_detail.getTCRate(sPCBTp:string;DisC:string='0');
begin
  if (sPCBTp='') or (DisC='') then
    SGrid.Cells[14,SGrid.Row]:='0'
  else begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select top 1 disc_rate from data0125 where pcb_type='''+sPCBTp+''' and low_limit<='+DisC+
                     ' and up_limit>'+DisC;
    DM.tmp.Open;
    if DM.tmp.IsEmpty then  SGrid.Cells[14,SGrid.Row]:='0' else SGrid.Cells[14,SGrid.Row]:=DM.tmp.Fields[0].AsString;
  end;
end;

procedure TFrm_detail.DBGridEh1CellClick(Column: TColumnEh);
begin
  if  Column=DBGridEh1.Columns[2] then
    Column.EditButtons[0].Visible:=DM.ADO124CATEGORY.AsString='异常板成本' ;
 // else
  //  Column.EditButtons[0].Visible:=false;
end;

procedure TFrm_detail.N5Click(Sender: TObject);
var i:integer;
begin
  SGrid.RowCount:=2;
  for i:=0 to SGrid.ColCount-1 do SGrid.Cells[i,1]:='';
  sumTC;
end;

procedure TFrm_detail.DBGridEh1Columns2EditButtons0Click(Sender: TObject;var Handled: Boolean);
  var Evt:TDataSetNotifyEvent;
begin
  try
    Frm_YCB:=TFrm_YCB.Create(nil);
    Frm_YCB.FTag:=Ftag;
    Frm_YCB.FDt:=DBDateTimeEditEh2.Field.AsString;
    Frm_YCB.Frkey10:=inttostr(EdtCust.Tag);
    if Frm_YCB.ShowModal=mrok then
    begin
      DM.ADO126.Close;
      DM.ADO126.Open;
      Frm_YCB.ADO53_1.First;
      while not Frm_YCB.ADO53_1.Eof do
      begin
        DM.ADO126.Append;
        DM.ADO126.FieldByName('rkey122').AsInteger:=DM.ADO122_1.FieldByName('rkey').AsInteger;
        DM.ADO126.FieldByName('rkey53').AsInteger:=Frm_YCB.ADO53_1.FieldByName('rkey').AsInteger;
        DM.ADO126.FieldByName('Qty_on_hand').AsInteger:=Frm_YCB.ADO53_1.FieldByName('QTY_ON_HAND').AsInteger;
        DM.ADO126.FieldByName('Latest_price').AsFloat:=Frm_YCB.ADO53_1.FieldByName('LATEST_PRICE').AsFloat;
        DM.ADO126.Post;
        Frm_YCB.ADO53_1.Next;
      end;
      Frm_YCB.ADO53_2.First;
      while not Frm_YCB.ADO53_2.Eof do
      begin
        DM.ADO126.Append;
        DM.ADO126.FieldByName('rkey122').AsInteger:=DM.ADO122_1.FieldByName('rkey').AsInteger;
        DM.ADO126.FieldByName('rkey53').AsInteger:=Frm_YCB.ADO53_2.FieldByName('rkey').AsInteger;
        DM.ADO126.FieldByName('Qty_on_hand').AsInteger:=Frm_YCB.ADO53_2.FieldByName('QTY_ON_HAND').AsInteger;
        DM.ADO126.FieldByName('Latest_price').AsFloat:=Frm_YCB.ADO53_2.FieldByName('LATEST_PRICE').AsFloat;
        DM.ADO126.Post;
        Frm_YCB.ADO53_2.Next;
      end;
      Evt:=DM.ADO124.BeforeEdit;
      DM.ADO124.BeforeEdit:=nil;
      DM.ADO124.Edit;
      DM.ADO124SHARE_base.Value:=strtofloat(Frm_YCB.Edit1.text);
      DM.ADO124.Post;
      DM.ADO124.BeforeEdit:=Evt;
    end;
  finally
    Frm_YCB.Free;
  end;
end;

end.

