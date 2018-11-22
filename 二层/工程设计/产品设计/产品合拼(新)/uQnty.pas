unit uQnty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Math, Main, DB, DBClient, Grids,
  DBGridEh, ADODB, DBGrids, ComCtrls;

type
  TfrmQnty = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    cdsOrder: TClientDataSet;
    cdsOrderRKEY25: TIntegerField;
    cdsOrderRKEY60: TIntegerField;
    cdsOrderSetQty: TIntegerField;
    cdsOrderMANU_PART_NUMBER: TStringField;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    aspCompare38: TADOStoredProc;
    Panel1: TPanel;
    Label1: TLabel;
    edtProdNo: TEdit;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    cdsUpdate: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    cdsOrderPARTS_ORDERED: TFloatField;
    cdsOrderspell_qty: TIntegerField;
    cdsOrderANALYSIS_CODE_1: TStringField;
    cdsOrderRate: TCurrencyField;
    lbl1: TLabel;
    edtRate: TEdit;
    btnAdd: TBitBtn;
    ud1: TUpDown;
    procedure btnOKClick(Sender: TObject);
    procedure edtKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure edtRateKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Compare_38(rkey25,rkey25_new:integer):boolean;//比较产品的工序是否一致
    procedure Transferdata; 
  public
    procedure InitForm();
  end;

var
  frmQnty: TfrmQnty;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmQnty.btnOKClick(Sender: TObject);
var
  rkey25,i: integer;
  iComponent: TComponent;
  RKEY81,Sufchar,NewCode,New_RKEY25: string;
  IsDeal,Check38: Boolean;
begin
  Check38:=True;
  cdsOrder.First;
  while not cdsOrder.Eof do
  begin
    if cdsOrder.FieldByName('SetQty').AsInteger<=0 then
    begin
      ShowMessage('SET数必须大于零');
      exit;
    end;
    if cdsOrder.RecNo =1 then
      rkey25:=cdsOrder.FieldByName('RKEY25').AsInteger
    else
    begin
      //判断如果产品工序不一致，是否继续？
      if Check38 then
      begin
        if Compare_38(rkey25,cdsOrder.FieldByName('RKEY25').AsInteger) then
          if Application.MessageBox('产品的生产工艺流程不一致，是否继续？','提示',MB_YESNO)=IDYES then
          begin
            Check38:=false;
          end
          else
          begin
            exit;
          end;
      end;
    end;
    cdsOrder.Next;
  end;
  IsDeal:= False;
  Transferdata;//把Set数量写进更新的订单明细表
  dm.con1.BeginTrans;
  try
    cdsUpdate.First;
    while not cdsUpdate.Eof do
    begin
        //1. INSERT Data0025
        if not IsDeal then
        begin
          with dm.qryTmp do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Select Case ');
            SQL.Add('when t192.CUSTSTASHIP=''Y'' then IsNull(t81.sufchar,'''')+IsNull(t15.part_templet,'''')+IsNull(t8.PRECHAR2,'''')');
            SQL.Add('when t192.CUSTSTASHIP=''N'' then IsNull(t15.part_templet,'''')+IsNull(t8.PRECHAR2,'''')+IsNull(t81.sufchar,'''')');
            SQL.Add('End as MANU_PART_NUMBER, t8.layer_pre, t81.sufchar');
            SQL.Add('From Data0060 t60 inner join Data0025 t25 on t60.CUST_PART_PTR=t25.RKEY');
            SQL.Add('inner join Data0015 t15 on t25.PROD_ROUTE_PTR=t15.RKEY');
            SQL.Add('inner join Data0008 t8 on t25.PROD_CODE_PTR=t8.RKEY');
            SQL.Add('inner join Data0081 t81 on t8.layer_pre=t81.RKEY');
            SQL.Add('inner join Data0192 t192 on 1=1');
            SQL.Add('Where t60.RKEY='+cdsUpdate.fieldbyName('rkey60').AsString);
            Open;
          end;
          NewCode:= dm.qryTmp.FieldByName('MANU_PART_NUMBER').AsString+'0H';
          RKEY81:= dm.qryTmp.FieldByName('layer_pre').AsString;
          Sufchar:= trim(dm.qryTmp.FieldByName('sufchar').AsString);
//          ShowMessage(StringofChar('0',length(Sufchar)-length(inttostr(strtoint(Sufchar)+1)))+inttostr(strtoint(Sufchar)+1));
          with dm.qryTmp do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Update Data0081 Set sufchar='+QuotedStr(StringofChar('0',length(Sufchar)-length(inttostr(strtoint(Sufchar)+1)))+inttostr(strtoint(Sufchar)+1)));
            SQL.Add('Where RKEY='+RKEY81);
//            ShowMessage(SQL.Text);
            ExecSQL;
          end;
          with dm.qryTmp do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Declare @New_RKEY25 int');
            SQL.Add('Insert Data0025(MANU_PART_NUMBER,MANU_PART_DESC,CREATED_BY_EMPL_PTR,ttype,PROD_ROUTE_PTR,CUSTOMER_PTR,pricing_principle,ORIG_CUSTOMER,');
            SQL.Add('PROD_CODE_PTR,SAMPLE_NR,LAYERS,ANALYSIS_CODE_2,ANALYSIS_CODE_3,SO_UNIT,set_qty,pcs_lngth,pcs_width,set_lngth,set_width,OPT_LOT_SIZE,');
            SQL.Add('EST_SCRAP,SHELF_LIFE,MFG_LEAD_TIME,REVIEW_DAYS,CUSTPART_ENT_DATE,IsSpell,TSTATUS)');
            SQL.Add('Select '''+NewCode+''',t25.MANU_PART_DESC,'+USERRKEY+',1,t25.PROD_ROUTE_PTR,t25.CUSTOMER_PTR,t25.pricing_principle,t25.ORIG_CUSTOMER,');
            SQL.Add('t25.PROD_CODE_PTR,t25.SAMPLE_NR,t25.LAYERS,t25.ANALYSIS_CODE_2,t25.ANALYSIS_CODE_3,t25.SO_UNIT,0,0,0,0,0,t25.OPT_LOT_SIZE,');
            SQL.Add('t25.EST_SCRAP,t25.SHELF_LIFE,t25.MFG_LEAD_TIME,t25.REVIEW_DAYS,getdate(),1,0');    //BOM_STATUS=2:BOM待制作
            SQL.Add('From Data0025 t25 inner join Data0060 t60 on t25.RKEY=t60.CUST_PART_PTR');
            SQL.Add('Where t60.RKEY='+cdsUpdate.fieldbyName('rkey60').AsString);
            SQL.Add('Set @New_RKEY25=@@Identity');
            SQL.Add('Select @New_RKEY25 AS New_RKEY25');
            Open;
          end;
          New_RKEY25:= dm.qryTmp.FieldByName('New_RKEY25').AsString;
        end;
        IsDeal:=True;
        //2. UPDATE Data0060.SpellTogether
        with dm.qryTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Update Data0060 Set SpellTogether=1 Where RKEY='+cdsUpdate.fieldbyName('rkey60').AsString);
          ExecSQL;
        end;
        //3. INSERT SpellRelation

        with dm.qryTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT SpellRelation(SpellTo_PTR,SpellFrom_PTR,PO_PTR,SetQnty)');
          SQL.Add('SELECT '+New_RKEY25+',t25.RKEY,t60.RKEY,'+cdsUpdate.fieldbyName('SETQty').AsString);
          SQL.Add('FROM Data0060 t60 INNER JOIN Data0025 t25 ON t60.CUST_PART_PTR=t25.RKEY');
          SQL.Add('WHERE t60.RKEY='+cdsUpdate.fieldbyName('rkey60').AsString);
//          ShowMessage(SQL.Text);
          ExecSQL;
        end;
        cdsUpdate.Next;
    end;
    edtProdNo.text:= NewCode;
    dm.con1.CommitTrans;
    ShowMessage('合拼成功');
    btnOK.Enabled:=false;
    DBGridEh1.ReadOnly:=true;
//    ModalResult:= mrOk;
  except
    on E:Exception do
    begin
      dm.con1.RollbackTrans;
      ShowMessage(E.Message);
//      ModalResult:= mrCancel;
    end;
  end;
end;

procedure TfrmQnty.edtKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#8]) then key:=#0;
end;

procedure TfrmQnty.InitForm;
begin
//  DBGridEh1.Columns[0].Footer.Value:='AAA'
end;

function TfrmQnty.Compare_38(rkey25, rkey25_new: integer): boolean;
begin
  aspCompare38.Parameters.ParamByName('@rkey25').value:=rkey25;
  aspCompare38.Parameters.ParamByName('@rkey25_new').value:=rkey25;
  try
    aspCompare38.ExecProc;
    result:=aspCompare38.Parameters.ParamByName('@RETURN_VALUE').value = 0;
  except
    result:=false;
  end;
end;

procedure TfrmQnty.Transferdata;
begin
  //如果相同的产品，有多个订单，需要赋值
  cdsOrder.DisableControls;
  try
    cdsUpdate.First; //
    while not cdsUpdate.Eof do
    begin
      if cdsOrder.Locate('rkey25',cdsUpdate.fieldbyName('rkey25').AsInteger,[]) then
      begin
        cdsUpdate.edit;
        cdsUpdate.FieldByName('SetQty').Value:=cdsOrder.FieldByName('SetQty').Value;
        cdsUpdate.Post;
      end;
      cdsUpdate.Next;
    end;
  finally
    cdsOrder.EnableControls;
  end;
end;

procedure TfrmQnty.btnAddClick(Sender: TObject);
begin
  if Trim(edtRate.Text) = '' then Exit;
  cdsOrder.DisableControls;
  try
    cdsOrder.First;
    while not cdsOrder.Eof do
    begin
      cdsOrder.Edit;
      cdsOrder.FieldByName('SetQty').Value := Round(cdsOrder.FieldByName('Rate').Value * StrToInt(Trim(edtRate.Text)));
      cdsOrder.Post;
      cdsOrder.Next;
    end;
  finally
   cdsOrder.First;
   cdsOrder.EnableControls;
  end;
end;

procedure TfrmQnty.edtRateKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then Abort;
end;

end.
