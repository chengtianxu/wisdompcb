unit AddFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGridEh, Menus, ADODB;

type
  TFrmAdd = class(TForm)
    PageControl1: TPageControl;
    ts1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    BitBtn5: TBitBtn;
    ts2: TTabSheet;
    Label14: TLabel;
    Label15: TLabel;
    Panel1: TPanel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    edt7: TEdit;
    edt10: TEdit;
    edt11: TEdit;
    edt12: TEdit;
    edt13: TEdit;
    edt14: TEdit;
    edt15: TEdit;
    edt16: TEdit;
    edt17: TEdit;
    edt18: TEdit;
    edt19: TEdit;
    edt20: TEdit;
    edt21: TEdit;
    edt22: TEdit;
    edt23: TEdit;
    edt24: TEdit;
    edt25: TEdit;
    edt26: TEdit;
    edt30: TEdit;
    edt31: TEdit;
    Label22: TLabel;
    Label35: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit9: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ts3: TTabSheet;
    Label20: TLabel;
    SpeedButton1: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N1: TMenuItem;
    StringGrid1: TStringGrid;
    N3: TMenuItem;
    BitBtn4: TBitBtn;
    Label21: TLabel;
    N4: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label29: TLabel;
    Label30: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure edt14KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N4Click(Sender: TObject);
    procedure edt14KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    procedure DeleteRow(Row: Integer);
  public
    { Public declarations }
    nowdate: string;
  end;

var
  FrmAdd: TFrmAdd;

implementation

uses
  common, Damo, Pick_Item_Single, ConstVar, PartNumberPrice;
{$R *.dfm}

procedure TFrmAdd.FormCreate(Sender: TObject);
begin
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select seed_value, convert(varchar(100),getdate(),23) as sysdate, '
      + ' convert(varchar(100),getdate()+60,23) as sysdate1  from data0004 where table_name= ''WZCP0085''';
    Open;
    edt1.Text := FieldValues['seed_value'];
    nowdate := FieldValues['sysdate'];
    DateTimePicker1.Date := StrToDate(FieldValues['sysdate']);
    DateTimePicker2.Date := StrToDate(FieldValues['sysdate1']);
  end;
  PageControl1.ActivePage := ts1;
end;

procedure TFrmAdd.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'cust_code/客户代码/100,customer_name/客户名称/120,sales_rep_name/跟单员/120,';
    InputVar.Sqlstr :='SELECT D10.rkey,D10.cust_code,D10.customer_name,D09.sales_rep_name,D10.CONTACT_NAME_1,D10.CONT_PHONE_1, '
      + ' CASE D10.customer_type WHEN 1 THEN ''正常'' WHEN 2 THEN ''新合作'' WHEN 3 THEN ''控制'' WHEN 4 THEN ''停止'' END AS status, '
      + ' CASE D10.credit_rating WHEN 1 THEN ''优'' WHEN 2 THEN ''良'' WHEN 3 THEN ''差'' END AS credit_rating '
      + ' FROM DATA0010 D10 '
      + ' INNER JOIN DATA0009 D09 on D10.sales_rep_ptr=D09.rkey';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt2.Text := frmPick_Item_Single.adsPick.FieldValues['cust_code'];
      edt3.Text := frmPick_Item_Single.adsPick.FieldValues['customer_name'];
      if not frmPick_Item_Single.adsPick.FieldByName('CONTACT_NAME_1').IsNull then
        edt11.Text := frmPick_Item_Single.adsPick.FieldValues['CONTACT_NAME_1'];
      if not frmPick_Item_Single.adsPick.FieldByName('CONT_PHONE_1').IsNull then
        edt12.Text :=  frmPick_Item_Single.adsPick.FieldValues['CONT_PHONE_1'];
      BitBtn1.Tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmAdd.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'prod_code/产品编码/100,product_name/产品名称/120,product_desc/产品描述/120,';
    InputVar.Sqlstr :='select data0008.rkey,data0008.prod_code,data0008.product_name,data0008.product_desc, '
      + 'data0002.rkey rkey02, data0002.unit_name from data0008 inner join data0002 on data0008.unit_ptr=data0002.rkey';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt4.Text := frmPick_Item_Single.adsPick.FieldValues['prod_code'];
      edt5.Text :=  frmPick_Item_Single.adsPick.FieldValues['product_name'];
      Label30.Caption :=  frmPick_Item_Single.adsPick.FieldValues['product_desc'];
      edt6.Text := frmPick_Item_Single.adsPick.FieldValues['unit_name'];
      edt6.Tag := frmPick_Item_Single.adsPick.FieldValues['rkey02'];
      BitBtn2.Tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmAdd.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'curr_code/货币代码/100,curr_name/货币名称/120,qte_base_to_other/汇率/120,';
    InputVar.Sqlstr :='select rkey, curr_code, curr_name, qte_base_to_other from data0001';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt13.Text := frmPick_Item_Single.adsPick.FieldValues['curr_code'];
      Label9.Caption :=  frmPick_Item_Single.adsPick.FieldValues['curr_name'];
      edt7.Text := frmPick_Item_Single.adsPick.FieldValues['qte_base_to_other'];
      BitBtn3.Tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmAdd.BitBtn5Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'code/审批流程代码/150,qte_approv_desc/审批流程描述/200,';
    InputVar.Sqlstr :='select rkey, code,  qte_approv_desc from data0264';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt10.Text := frmPick_Item_Single.adsPick.FieldValues['code'];
      Label22.Caption := frmPick_Item_Single.adsPick.FieldValues['qte_approv_desc'];
      BitBtn5.Tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmAdd.BitBtn6Click(Sender: TObject);
var
  i: Integer;
begin
  if DM.qry87_1.Active then
  begin
    dm.qry87_1.First;
    for i := 0 to dm.qry87_1.RecordCount - 1 do
    begin
      dm.qry87_1.Delete;
      dm.qry87_1.Next;
    end;
    dm.qry87_1.Active := False;
  end;
  Close;
end;

procedure TFrmAdd.SpeedButton2Click(Sender: TObject);
begin
  if (edt14.Text <> '') and  (edt20.Text <> '') and  (edt15.Text <> '') and  (edt25.Text <> '')
    and  (edt21.Text <> '') and  (edt22.Text <> '')and  (edt17.Text <> '')
    and  (edt19.Text <> '') and  (edt26.Text <> '')and  (edt22.Text <> '')  then
  begin
    edit1.Text := FloatToStr(strtofloat(edt14.Text) * strtofloat(edt20.Text))  ;
    edit2.Text := FloatToStr(strtofloat(edt14.Text) * strtofloat(edt21.Text))  ;
    edit3.Text := FloatToStr(strtofloat(edt14.Text) * strtofloat(edt22.Text))  ;
    edt23.Text := FloatToStr(strtofloat(edt15.Text) * strtofloat(edt17.Text))  ;
    edt24.Text := FloatToStr(strtofloat(edt15.Text) * strtofloat(edt19.Text))  ;
    edit6.Text := FloatToStr(strtofloat(edt14.Text) * strtofloat(edt25.Text))  ;
    edit7.Text := FloatToStr(strtofloat(edt14.Text) * strtofloat(edt26.Text))  ;
    edit8.Text := FloatToStr((strtofloat(edit1.Text) + strtofloat(edit2.Text) + strtofloat(edit3.Text)  + strtofloat(edt23.Text)
      + strtofloat(edt24.Text) + strtofloat(edit6.Text) + strtofloat(edit7.Text))) ;
  end;
end;

procedure TFrmAdd.SpeedButton3Click(Sender: TObject);
begin
  if edt16.Text <> '' then Edit5.text := FloatToStr(strtofloat(Edit8.text) * (1 + strtofloat(edt16.text)/100));
end;

procedure TFrmAdd.SpeedButton4Click(Sender: TObject);
begin
  if (edt18.Text <> '') and  (Edit5.Text <> '') then
  Edit9.text := FloatToStr(strtofloat(Edit5.text) * (1 + strtofloat(edt18.text)/100));
end;

procedure TFrmAdd.SpeedButton5Click(Sender: TObject);
begin
  if (edt30.Text <> '') and  (Edit9.Text <> '') and (strtofloat(edt30.Text) <> 0) then
  Edit4.Text := FloatToStr(strtofloat(Edit9.Text) / strtofloat(edt30.Text));  // 本厂含税报价 / 市场参考价格
end;

procedure TFrmAdd.SpeedButton6Click(Sender: TObject);
begin
  if (edt30.Text <> '') and  (Edit9.Text <> '') then
  edt31.Text := FloatToStr(strtofloat(edt30.Text) - strtofloat(Edit9.Text));  // 本厂价格优势 = 市场参考价格 - 本厂含税报价
end;

procedure TFrmAdd.BitBtn7Click(Sender: TObject);
var
  rkeycp85, i, j, status85: Integer;
  NewTnumber: string;
begin
  if Trim(edt1.Text) = '' then
  begin
   ShowMessage('报价单号不能为空！');
   PageControl1.ActivePage := ts1;
   edt1.SetFocus();
   Exit;
  end;
  if Trim(edt2.Text) = '' then
  begin
   ShowMessage('客户代码不能为空！');
   PageControl1.ActivePage := ts1;
   edt2.SetFocus();
   Exit;
  end;
  if Trim(edt4.Text) = '' then
  begin
   ShowMessage('产品编码不能为空！');
   PageControl1.ActivePage := ts1;
   edt4.SetFocus();
   Exit;
  end;
  if Trim(edt10.Text) = '' then
  begin
   ShowMessage('审批流程不能为空！');
   PageControl1.ActivePage := ts1;
   edt10.SetFocus();
   Exit;
  end;
  if Trim(edt13.Text) = '' then
  begin
   ShowMessage('货币代码不能为空！');
   PageControl1.ActivePage := ts1;
   edt13.SetFocus();
   Exit;
  end;
  if StrToInt(Trim(edt14.Text)) <= 0 then
  begin
   ShowMessage('下单数量不能为0！');
   PageControl1.ActivePage := ts2;
   edt14.SetFocus();
   Exit;
  end;
  if StrToInt(Trim(edt15.Text)) <= 0 then
  begin
   ShowMessage('工时不能为0！');
   PageControl1.ActivePage := ts2;
   edt15.SetFocus();
   Exit;
  end;
  for i := 0 to StringGrid1.RowCount - 2 do
  begin
    if (Trim(StringGrid1.Cells[2, i + 1]) = '') then
    begin
      ShowMessage('材料成本输入不完整，请检查！');
      Exit;
    end;
  end;
  if StrToDate(nowdate) > DateTimePicker2.Date then
  begin
    if MessageBox(Handle,'有效日期小于当前日期，确认要保存吗？','提示', MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  end;

  if DM.flag = 0 then    //新增
  begin
    try
      with DM.qrytemp do
      begin
        //if StrToDate(nowdate) > DateTimePicker2.Date then status85 := 2 else status85 := 0;
        DM.ADOConnection1.BeginTrans;
        //向85插入一条记录
        Close;
        SQL.Clear;
        SQL.Text := Format('insert into wzcp0085([TNUMBER],[customer_ptr],[CUST_PART_PTR],[CUST_CONTACT] '
          + ',[CUST_CONTACT_PHONE],[QBY_EMPL_PTR],[QTE_DATE],[EXPIRATION_DATE], '
          + '[AUDITED_STATUS],[NOTE_INFO],[PROD_ROUTE_PTR],[CURR_PTR],[CURR_RATE],[vatax],[unit_ptr],[quantity],[MATL_COST] '
          + ',[manpower_cost],[ovhd_cost],[outward_cost],[manpower] '
          + ',[research_cost],[software_cost],[manage_cost],[total_cost] '
          + ',[profit_rate],[quote_price],[quote_taxprice],[reference] '
          + ',[superiority],[manpower_price],[ovhd_price]) '
          + ' VALUES(''%s'', %d, %d, ''%s'', ''%s'', %d, ''%s'', ''%s'', %d, ''%s'', '
          + ' %d, %d, %f, %f, %d, %f, %f, %f, %f, %f, %f, %f, %f,'
          + ' %f, %f, %f, %f, %f, %f, %f, %f, %f)',
          [edt1.text, BitBtn1.Tag, bitbtn2.tag, edt11.Text,
           edt12.Text, StrToInt(user_ptr), datetostr(DateTimePicker1.Date), datetostr(DateTimePicker2.Date),
           0, Memo1.Text, BitBtn5.Tag, BitBtn3.Tag,
           StrToFloat(edt7.Text), StrToFloat(edt18.Text), edt6.Tag, StrToFloat(edt14.Text), StrToFloat(Edit1.Text),
           StrToFloat(edt23.Text), StrToFloat(edt24.Text), StrToFloat(Edit2.Text), StrToFloat(edt15.Text),
           StrToFloat(edit6.Text), StrToFloat(Edit7.Text), StrToFloat(Edit3.Text), StrToFloat(Edit8.Text),
           StrToFloat(edt16.Text), StrToFloat(Edit5.Text), StrToFloat(Edit9.Text), StrToFloat(edt30.Text),
           StrToFloat(edt31.Text), StrToFloat(edt17.Text), StrToFloat(edt19.Text)]) ;
        ExecSQL;

        //如果本窗体stringgrid中有数据，则向wzcp0086表中插入数据，反之不执行
        if Trim(StringGrid1.Cells[2,1]) <> '' then
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'select top 1 rkey from wzcp0085 order by rkey desc';
          Open;
          rkeycp85 := FieldValues['rkey'];
          for i := 0 to StringGrid1.RowCount - 2 do
          begin
            Close;
            SQL.Clear;
            SQL.Text := Format('insert into wzcp0086(quote_ptr, step_no, material_type, material_price, remark) '
              + ' values(%d, %d, ''%s'', %f, ''%s'')', [rkeycp85, strtoint(StringGrid1.Cells[0, i+1]),
              StringGrid1.Cells[1, i+1], strtofloat(StringGrid1.Cells[2, i+1]), StringGrid1.Cells[3, i+1]]);
            ExecSQL;
          end;
        end;
        //如果无数据，不执行插入语句，有则向wzcp0087表中插入信息
        if not DM.qry87_1.Active then DM.qry87_1.Open;
        if DM.qry87_1.RecordCount > 0 then
        begin
          dm.qry87_1.Filter := '';
          dm.qry87_1.First;
          for i := 0 to dm.qry87_1.RecordCount - 1 do
          begin
            Close;
            SQL.Clear;
            SQL.Text := Format('insert into wzcp0087(quote_ptr,step_no,INVENT_PTR,QUAN_BOM,STD_COST,VENDOR) '
              + 'values(%d, %d, %d, %f, %f, ''%s'')',
              [rkeycp85, dm.qry87_1.FieldByName('step_no').AsInteger,
              dm.qry87_1.FieldByName('INVENT_PTR').AsInteger,dm.qry87_1.FieldByName('QUAN_BOM').AsFloat,
              dm.qry87_1.FieldByName('STD_COST').AsFloat,dm.qry87_1.FieldByName('VENDOR').AsString]);
            ExecSQL;
            dm.qry87_1.Next;
          end;
        end;
        //更新04表，报价单号+1
        NewTnumber := Copy(edt1.Text, 3, Length(edt1.Text)- 2);
        NewTnumber := 'QT' + IntToStr(StrToInt(NewTnumber) + 1);
        Close;
        SQL.Clear;
        SQL.Text := 'update data0004 set seed_value= ' + QuotedStr(NewTnumber) + ' where table_name=''wzcp0085''';
        ExecSQL;
        DM.ADOConnection1.CommitTrans;
      end;
    except
      on e: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        ShowMessage('网络异常，请稍后重试！ ('+e.Message+')');
      end;
    end;
    ShowMessage('保存成功！');
    dm.qryCp85.Close;
    DM.qryCp85.Open;
    DM.qryCp85.First;
  end;

  if dm.flag = 1 then   //编辑
  begin
    j := DM.qryCp85rkey.AsInteger;
    try
      with DM.qry85 do   //更新wzcp0085表数据
      begin
        DM.ADOConnection1.BeginTrans;
        Edit;
        FieldByName('TNUMBER').AsString := edt1.Text;                             //报价单号
        FieldByName('customer_ptr').AsInteger := BitBtn1.Tag;                     //客户data0010rkey
        FieldByName('CUST_PART_PTR').AsInteger := bitbtn2.tag;                    //产品data0008rkey
        FieldByName('CUST_CONTACT').AsString := edt11.Text;                       //联系人
        FieldByName('CUST_CONTACT_PHONE').AsString := edt12.Text;                 //联系电话
        FieldByName('QBY_EMPL_PTR').AsInteger := StrToInt(user_ptr);              //报价人员data0005rkey
        FieldByName('QTE_DATE').AsString := DateToStr(DateTimePicker1.Date);        //报价日期
        FieldByName('EXPIRATION_DATE').AsString := DateToStr(DateTimePicker2.Date); //有效日期
      //  if StrToDate(nowdate) > DateTimePicker2.Date then FieldByName('audited_status').AsInteger := 2;            //状态
        FieldByName('NOTE_INFO').AsString := Memo1.Text;                          //备注
        FieldByName('PROD_ROUTE_PTR').AsInteger := BitBtn5.Tag;                   //审批流程data0264rkey
        FieldByName('CURR_PTR').AsInteger := BitBtn3.Tag;                         //货币data0001rkey
        FieldByName('CURR_RATE').AsFloat := StrToFloat(edt7.Text);                //汇率
        FieldByName('vatax').AsFloat := StrToFloat(edt18.Text);                   //增值税率
        FieldByName('unit_ptr').AsInteger := edt6.Tag;                            //单位data0002rkey
        FieldByName('quantity').AsFloat := StrToFloat(edt14.Text);                //数量
        FieldByName('MATL_COST').AsFloat := StrToFloat(Edit1.Text);               //材料总成本
        FieldByName('manpower_cost').AsFloat := StrToFloat(edt23.Text);           //人工总成本
        FieldByName('ovhd_cost').AsFloat := StrToFloat(edt24.Text);               //制造总费用
        FieldByName('outward_cost').AsFloat := StrToFloat(Edit2.Text);            //外发总成本
        FieldByName('manpower').AsFloat := StrToFloat(edt15.Text);                //工时
        FieldByName('research_cost').AsFloat := StrToFloat(edit6.Text);           //研发总成本
        FieldByName('software_cost').AsFloat := StrToFloat(Edit7.Text);           //软件总成本
        FieldByName('manage_cost').AsFloat :=  StrToFloat(Edit3.Text);            //管理总费用
        FieldByName('total_cost').AsFloat :=  StrToFloat(Edit8.Text);             //合计总成本
        FieldByName('profit_rate').AsFloat := StrToFloat(edt16.Text);             //利润
        FieldByName('quote_price').AsFloat := StrToFloat(Edit5.Text);             //不含税报价 = 合计总成本 * （1 + 利润）
        FieldByName('quote_taxprice').AsFloat := StrToFloat(Edit9.Text);          //含税报价 = 不含税报价 * （1 + 税率）
        FieldByName('reference').AsFloat := StrToFloat(edt30.Text);               //市场参考价格
        FieldByName('superiority').AsFloat := StrToFloat(edt31.Text);             //价格优势 = 市场参考价格 - 含税报价
        FieldByName('manpower_price').AsFloat := StrToFloat(edt17.Text);          //人工成本每小时价格
        FieldByName('ovhd_price').AsFloat := StrToFloat(edt19.Text);              //制造费用每小时价格
        UpdateBatch(arAll);
        DM.ADOConnection1.CommitTrans;
      end;

      //如果材料类别数据已清空，则直接删除。
      if Trim(StringGrid1.Cells[2,1]) = '' then
      begin
        DM.ADOConnection1.BeginTrans;
        with DM.qrytemp do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'delete from wzcp0086 where quote_ptr = ' + DM.qryCp85rkey.AsString;
          ExecSQL;
        end;
        DM.ADOConnection1.CommitTrans;
      end;
      //如果材料类别有数据，则先删除该数据，再增加当前数据
      if Trim(StringGrid1.Cells[2,1]) <> '' then
      begin
        DM.ADOConnection1.BeginTrans;
        with DM.qrytemp do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'delete from wzcp0086 where quote_ptr = ' + DM.qryCp85rkey.AsString;
          ExecSQL;
        end;
        DM.ADOConnection1.CommitTrans;
        with DM.qry86 do
        begin
          DM.ADOConnection1.BeginTrans;
          Close;
          Open;
          for i := 0 to StringGrid1.RowCount - 2 do
          begin
            Append;
            FieldByName('quote_ptr').AsInteger := DM.qryCp85rkey.AsInteger;
            FieldByName('step_no').AsInteger := strtoint(StringGrid1.Cells[0, i+1]);
            FieldByName('material_type').AsString := StringGrid1.Cells[1, i+1];
            FieldByName('material_price').AsFloat := StrToFloat(StringGrid1.Cells[2, i+1]);
            FieldByName('remark').AsString := StringGrid1.Cells[3, i+1];
          end;
          UpdateBatch(arAll);
          DM.ADOConnection1.CommitTrans;
        end;
      end;
      if not dm.qry87_1.Active then dm.qry87_1.Open;
      DM.qry87_1.Filter := '';
      if DM.qry87_1.RecordCount > 0 then
      begin
        DM.ADOConnection1.BeginTrans;
        with DM.qrytemp do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'delete from wzcp0087 where quote_ptr = ' + DM.qryCp85rkey.AsString;
          ExecSQL;
        end;
        DM.ADOConnection1.CommitTrans;
        with DM.qry87 do
        begin
          DM.ADOConnection1.BeginTrans;
          Close;
          Open;
          DisableControls;
          DM.qry87_1.First;
          for i := 0 to DM.qry87_1.RecordCount - 1 do
          begin
            Append;
            FieldByName('quote_ptr').AsInteger := DM.qryCp85rkey.AsInteger;
            FieldByName('step_no').AsInteger := DM.qry87_1.FieldValues['step_no'];
            FieldByName('invent_ptr').AsString := DM.qry87_1.FieldValues['invent_ptr'];
            FieldByName('quan_bom').AsFloat := DM.qry87_1.FieldValues['quan_bom'];
            FieldByName('std_cost').AsString := DM.qry87_1.FieldValues['std_cost'];
            if not DM.qry87_1.FieldByName('vendor').IsNull then
              FieldByName('vendor').AsString := DM.qry87_1.FieldValues['vendor'];
            DM.qry87_1.Next;
          end;
          UpdateBatch(arAll);
          DM.ADOConnection1.CommitTrans;

          Enablecontrols;
        end;
      end;
      showMessage('此次修改数据已保存成功！');
    except
      on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        showmessage('网络异常，请稍后重试! (' + e.Message + ')');
      end;
    end;
    dm.qryCp85.Close;
    DM.qryCp85.Open;
    DM.qryCp85.Locate('rkey',j, []);
  end;
  dm.qry87_1.First;
  for i := 0 to dm.qry87_1.RecordCount - 1 do
  begin
    dm.qry87_1.Delete;
    dm.qry87_1.Next;
  end;
  dm.qry87_1.Active := False;
  Close;
end;

//页面切换事件
procedure TFrmAdd.PageControl1Change(Sender: TObject);
var
  i: Integer;
begin

  if PageControl1.ActivePage = ts3 then
  begin
    StringGrid1.Cells[0,1] := '1';
    StringGrid1.Cells[0,0] := '序号';
    StringGrid1.Cells[1,0] := '材料类别';
    StringGrid1.Cells[2,0] := '材料价格';
    StringGrid1.Cells[3,0] := '备注';
    StringGrid1.Col := 1;
    StringGrid1.Row := 1;
    Label29.Caption := '产品编码: ' + edt4.Text + ',    ' + '名称: ' + edt5.Text
      + ',    ' + '规格：' + Label30.Caption + ',    ' + '单位：' + edt6.Text;
    Label29.Font.Color := clTeal;
  end;

  if PageControl1.ActivePage = ts2 then
  begin
    if StringGrid1.Cells[2, 1] <> '' then
    begin
      edt20.Text := '0.00';

      {//删除空行
      for i := 0 to StringGrid1.RowCount - 2 do
      begin
        if (Trim(StringGrid1.Cells[2, i + 1]) = '') then
        begin
          DeleteRow(i + 1);
        end;
      end;
      //重新给StringGrid1的第一列赋值
      for i := 0 to StringGrid1.RowCount - 1 do
      begin
        StringGrid1.Cells[0, i + 1] := IntToStr(i + 1);
      end;
      //如果删除后只剩下一行，则初始化StringGrid1的显示方式
      if StringGrid1.RowCount = 1 then
      begin
        StringGrid1.RowCount := 2;
        StringGrid1.FixedRows := 1;
      end;}
      for i := 0 to StringGrid1.RowCount - 2 do
      begin
        if (Trim(StringGrid1.Cells[2, i + 1]) = '') then
        begin
          ShowMessage('材料成本输入不完整，请检查！');
          PageControl1.ActivePage := ts3;
          Break;
        end;
      end;
      //获取合计价格
      for i := 0 to StringGrid1.RowCount - 2 do
      begin
        if (Trim(StringGrid1.Cells[2, i + 1]) <> '') then
          edt20.Text := FloatToStr( strtofloat(edt20.Text) + strtofloat(StringGrid1.Cells[2, i + 1]) );
      end;
    end;
    for i := 0 to ts2.ControlCount - 1 do
    begin
      if UpperCase(ts2.Controls[i].ClassName) = UpperCase('TEdit') then
      begin
        if (Trim(TEdit(ts2.Controls[i]).Text) = '0')  or (TEdit(ts2.Controls[i]).Text = '') then
        begin
          TEdit(ts2.Controls[i]).Font.Color := clRed;
        end
        else TEdit(ts2.Controls[i]).Font.Color := clBlack;
      end;
    end;
    BitBtn4.Click;
  end;

end;

//StringGrid1编辑列触发事件
procedure TFrmAdd.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if (ACol = 4) then
  begin
    if (ARow = Self.StringGrid1.RowCount-1) then
    begin
      StringGrid1.Cells[4,0]:='新增';
      SpeedButton1.Visible := False;
      SpeedButton1.Visible := CanSelect;
      if not CanSelect then Exit;
      SpeedButton1.Parent := StringGrid1;
      R := StringGrid1.CellRect(ACol, ARow);
      SpeedButton1.BoundsRect := R;
      SpeedButton1.Width := SpeedButton1.Height;
      SpeedButton1.Left  := R.Right - SpeedButton1.Width;
    end;
  end
  else
  begin
    SpeedButton1.Visible := False;
  end;

  if (ACol = 0) or (ACol = 4) then
    StringGrid1.Options   :=   StringGrid1.Options   -   [goEditing]
  else
    StringGrid1.Options   :=   StringGrid1.Options   +   [goEditing];

end;

//增加StringGrid1一行
procedure TFrmAdd.SpeedButton1Click(Sender: TObject);
begin
   StringGrid1.RowCount := StringGrid1.RowCount + 1;
   Self.SpeedButton1.Visible:=False;
   StringGrid1.Cells[0, StringGrid1.Row + 1] := IntToStr(StringGrid1.Row + 1);
end;

//一键计算
procedure TFrmAdd.BitBtn4Click(Sender: TObject);
var
  i: Integer;
begin
  SpeedButton2.Click;
  SpeedButton3.Click;
  SpeedButton4.Click;
  SpeedButton5.Click;
  SpeedButton6.Click;
      for i := 0 to ts2.ControlCount - 1 do
      begin
        if UpperCase(ts2.Controls[i].ClassName) = UpperCase('TEdit') then
        begin
          if (Trim(TEdit(ts2.Controls[i]).Text) = '0')  or (TEdit(ts2.Controls[i]).Text = '') then
          begin
            TEdit(ts2.Controls[i]).Font.Color := clRed;
          end
          else TEdit(ts2.Controls[i]).Font.Color := clBlack;
        end;
      end;
end;

//编辑材料类型明细
procedure TFrmAdd.N3Click(Sender: TObject);
begin
  dm.tag := StringGrid1.Row;
  FrmNumberPrice := TFrmNumberPrice.Create(Application);
  if FrmNumberPrice.ShowModal = mrok then
  begin
    StringGrid1.Cells[2, StringGrid1.Row] := FloatToStr(DM.inventTotalPrice);
  end;
  FrmNumberPrice.Free;
end;

//窗体展示时（编辑和查看状态）
procedure TFrmAdd.FormShow(Sender: TObject);
var
  i: Integer;
begin
  if (DM.flag = 1) or (DM.flag = 2) then
  begin
    edt1.Text := DM.qryCp85.FieldValues['TNumber']; //报价单号
    edt2.Text := DM.qryCp85.FieldValues['cust_code'];
    edt3.Text := DM.qryCp85.FieldValues['customer_name'];
    BitBtn1.Tag := DM.qryCp85.FieldValues['customer_Ptr'];
    edt4.Text := DM.qryCp85.FieldValues['prod_code'];
    edt5.Text := DM.qryCp85.FieldValues['product_name'];
    BitBtn2.Tag := DM.qryCp85.FieldValues['cust_part_ptr'];
    edt6.Text := DM.qryCp85.FieldValues['unit_name'];
    edt6.Tag := DM.qryCp85.FieldValues['unit_ptr'];
    edt7.Text := FloatToStr(DM.qryCp85.FieldValues['curr_rate']);
    datetimepicker1.Date := DM.qryCp85.FieldValues['qte_date'];
    datetimepicker2.Date:= DM.qryCp85.FieldValues['expiration_date'];
    edt10.Text := DM.qryCp85.FieldValues['code'];
    Label22.Caption := DM.qryCp85.FieldValues['qte_approv_desc'];
    bitbtn5.Tag := DM.qryCp85.FieldValues['prod_route_ptr'];
    edt11.Text := DM.qryCp85.FieldValues['cust_contact'];
    edt12.Text := DM.qryCp85.FieldValues['cust_contact_phone'];
    edt13.Text := DM.qryCp85.FieldValues['curr_code'];
    Label9.Caption := DM.qryCp85.FieldValues['curr_name'];
    BitBtn3.Tag := DM.qryCp85.FieldValues['curr_ptr'];
    edt14.Text := DM.qryCp85.FieldValues['quantity'];
    edt15.Text := DM.qryCp85.FieldValues['manpower'];

    Edit1.Text := DM.qryCp85.FieldValues['matl_cost'];
    edt20.Text := FloatToStr(DM.qryCp85.FieldValues['matl_cost']/DM.qryCp85.FieldValues['quantity']);

    Edit2.Text := DM.qryCp85.FieldValues['outward_cost'];
    edt21.Text := FloatToStr(DM.qryCp85.FieldValues['outward_cost']/DM.qryCp85.FieldValues['quantity']);

    Edit3.Text := DM.qryCp85.FieldValues['manage_cost'];
    edt22.Text := FloatToStr(DM.qryCp85.FieldValues['manage_cost']/DM.qryCp85.FieldValues['quantity']);

    edt23.Text := DM.qryCp85.FieldValues['manpower_cost'];

    edt17.Text := FloatToStr(DM.qryCp85.FieldValues['manpower_cost']/DM.qryCp85.FieldValues['manpower']);

    edt24.Text := DM.qryCp85.FieldValues['ovhd_cost'];
    edt19.Text := FloatToStr(DM.qryCp85.FieldValues['ovhd_cost']/DM.qryCp85.FieldValues['manpower']);

    Edit6.Text := DM.qryCp85.FieldValues['research_cost'];
    edt25.Text := FloatToStr(DM.qryCp85.FieldValues['research_cost']/DM.qryCp85.FieldValues['quantity']);

    Edit7.Text := DM.qryCp85.FieldValues['software_cost'];
    edt26.Text := FloatToStr(DM.qryCp85.FieldValues['software_cost']/DM.qryCp85.FieldValues['quantity']);

    Edit8.Text := DM.qryCp85.FieldValues['matl_cost'] + DM.qryCp85.FieldValues['outward_cost']
      + DM.qryCp85.FieldValues['manage_cost'] + DM.qryCp85.FieldValues['manpower_cost']
      + DM.qryCp85.FieldValues['ovhd_cost'] + DM.qryCp85.FieldValues['research_cost']
      + DM.qryCp85.FieldValues['software_cost'];
    Memo1.Text := DM.qryCp85.FieldValues['note_info'];

    edt16.Text := DM.qryCp85.FieldValues['profit_rate'];
    Edit5.Text := DM.qryCp85.FieldValues['quote_price'];
    edt18.Text := DM.qryCp85.FieldValues['vatax'];
    Edit9.Text := DM.qryCp85.FieldValues['quote_taxprice'];
    edt30.Text := DM.qryCp85.FieldValues['reference'];
    if edt30.Text <> '0' then
      Edit4.Text := DM.qryCp85.FieldValues['quote_taxprice']/DM.qryCp85.FieldValues['reference'];
    edt31.Text := DM.qryCp85.FieldValues['superiority'];

    for i := 1 to StringGrid1.RowCount-1 do
      StringGrid1.Rows[i].Clear;
    StringGrid1.RowCount:=2;

    DM.qryCp86.Close;
    DM.qryCp86.Parameters.ParamByName('rkey85').Value := DM.qryCp85.FieldValues['rkey'];
    DM.qryCp86.Open;
    for  i := 0 to DM.qryCp86.RecordCount - 1 do
    begin
      StringGrid1.Cells[0, i+1] := DM.qryCp86.FieldValues['step_no'];
      StringGrid1.Cells[1, i+1] := DM.qryCp86.FieldValues['material_type'];
      StringGrid1.Cells[2, i+1] := DM.qryCp86.FieldValues['material_price'];
      StringGrid1.Cells[3, i+1] := DM.qryCp86.FieldValues['remark'];
      StringGrid1.RowCount := DM.qryCp86.RecordCount + 1;
      DM.qryCp86.Next;
    end;

    if DM.flag = 2 then BitBtn7.Enabled := False;
  end;

end;

//删除
procedure  TFrmAdd.DeleteRow(Row: Integer);
var 
  i: integer;
begin
  if (Row < StringGrid1.RowCount) and (Row > StringGrid1.FixedRows-1) then
  begin
    if Row < StringGrid1.RowCount - 1 then
    begin
      for i := Row to StringGrid1.RowCount - 1 do
      begin
        StringGrid1.Rows[i] := StringGrid1.Rows[i + 1];
      end;
    end
    else StringGrid1.Rows[Row].Clear;
    StringGrid1.RowCount := StringGrid1.RowCount - 1;
  end;
end;

//删除
procedure TFrmAdd.N2Click(Sender: TObject);
var
  Sel: TGridRect;
  i: Integer;
begin
  Sel := StringGrid1.Selection;
  DeleteRow(Sel.Top);
  DM.qry87_1.Filter := '';
  DM.qry87_1.Open;

  //删除缓存中的指定数据（step_no）
  DM.qry87_1.First;
  while (not DM.qry87_1.eof) do
  if (DM.qry87_1step_no.Value = StringGrid1.Row) then DM.qry87_1.Delete
  else DM.qry87_1.next;

  //更新缓存中的step_no，如果大于删除的step_no，则step_no 等于 step_no - 1
  DM.qry87_1.First;
  for i := 0 to DM.qry87_1.RecordCount - 1 do
  begin
    if DM.qry87_1step_no.Value > StringGrid1.Row then
    begin
      DM.qry87_1.Edit;
      DM.qry87_1step_no.Value := DM.qry87_1step_no.Value - 1;
      DM.qry87_1.Post;
    end;
    DM.qry87_1.Next;
  end;

  //重新给StringGrid1的第一列赋值
  for i := 0 to StringGrid1.RowCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := IntToStr(i + 1);
  end;

  //如果删除后只剩下一行，则初始化StringGrid1的显示方式
  if StringGrid1.RowCount = 1 then
  begin
    StringGrid1.RowCount := 2;
    StringGrid1.FixedRows := 1;
  end;

end;

//全部清空
procedure TFrmAdd.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to StringGrid1.RowCount-1 do
  StringGrid1.Rows[i].Clear;
 StringGrid1.RowCount:=2;
 StringGrid1.Cells[0,1] := '1';
 if (dm.qry87_1.Active) then
 begin
   if (dm.qry87_1.RecordCount <= 0)  then
   begin
     ShowMessage('当前数据为空，无需清空！');
     Exit;
   end;
 end;
 if (dm.qry87_1.Active) then
 begin
   if (dm.qry87_1.RecordCount > 0) then
   begin
     DM.qry87_1.Close;
   end;
 end;
end;

//鼠标离开时，判断该edit的值是否为0，为0则显示红色提醒，否则显示黑色正常。
procedure TFrmAdd.edt14KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
begin
  for i := 0 to ts2.ControlCount - 1 do
  begin
    if UpperCase(ts2.Controls[i].ClassName) = UpperCase('TEdit') then
    begin
      if (Trim(TEdit(ts2.Controls[i]).Text) = '0')  or (TEdit(ts2.Controls[i]).Text = '') then
      begin
        TEdit(ts2.Controls[i]).Font.Color := clRed;
      end
      else TEdit(ts2.Controls[i]).Font.Color := clBlack;
    end;
  end;
end;

//一键导入材料成本
procedure TFrmAdd.N4Click(Sender: TObject);
var
  i, j, step_no: Integer;
  rkeycp140: string;
begin
  dm.qry87_1.Close;
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select * from wzcp0140 where part_ptr= ' + IntToStr(BitBtn2.Tag) + ' and status=1';
    Open;
    if not IsEmpty then
    begin
      First;
      for i := 0 to RecordCount - 1 do
      begin
        rkeycp140 := IntToStr(FieldValues['rkey']);
        StringGrid1.Cells[0, i+1] := IntToStr(i + 1);
        StringGrid1.Cells[1, i+1] := FieldValues['part_name'];
        StringGrid1.Cells[2, i+1] := FieldValues['amount'];
        StringGrid1.RowCount := RecordCount + 1;
        with DM.qrytemp1 do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'select wzcp0148.*, data0017.inv_part_number from wzcp0148 inner join data0017 '
            + 'on wzcp0148.invent_ptr=data0017.rkey where rkey_cp140 = ' + rkeycp140;
          Open;
          if not IsEmpty then
          begin
            if not dm.qry87_1.Active then
              dm.qry87_1.Open;
            First;
            for j := 0 to RecordCount - 1 do
            begin
              DM.qry87_1.Append;
              DM.qry87_1quote_ptr.Value := 0;
              DM.qry87_1step_no.Value := i + 1;
              DM.qry87_1inv_part_number.Value := FieldValues['inv_part_number'];
              DM.qry87_1QUAN_BOM.Value := FieldValues['QUAN_BOM'];
              DM.qry87_1STD_COST.Value := FieldValues['STD_COST'];
              if FieldValues['VENDOR'] <> '' then DM.qry87_1VENDOR.Value := FieldValues['VENDOR'];
              DM.qry87_1INVENT_PTR.Value := FieldValues['INVENT_PTR'];
              DM.qry87_1.Post;
              Next;
            end;
          end;
        end;
        Next;
      end;
    end
    else
    begin
      ShowMessage('该产品没有设置材料报价，请检查工程编码材料报价信息！');
      Exit;
    end;
  end;
end;

procedure TFrmAdd.edt14KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8,'0'..'9','.']) then Key := #0;
end;

procedure TFrmAdd.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if StringGrid1.Col = 2 then
  begin
    if not (Key in ['0'..'9', #8, #46]) then Key := #0;
  end;
end;

end.
