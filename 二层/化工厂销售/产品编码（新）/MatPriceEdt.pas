unit MatPriceEdt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGridEh, DB,
  ADODB;

type
  TfrmMatPriceEdt = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnExit: TBitBtn;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    btnLook: TBitBtn;
    DBGridEh1: TDBGridEh;
    DBEdit9: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    lblProdName: TLabel;
    lblProdCode: TLabel;
    aqCP148_s: TADOQuery;
    aqCP148_srkey_cp140: TIntegerField;
    aqCP148_sINVENT_PTR: TIntegerField;
    aqCP148_sQUAN_BOM: TBCDField;
    aqCP148_sSTD_COST: TBCDField;
    aqCP148_sVENDOR: TStringField;
    btnBOMIN: TSpeedButton;
    btnMatPriceIN: TSpeedButton;
    aqCP148_sinvent_or: TIntegerField;
    procedure btnLookClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure btnBOMINClick(Sender: TObject);
    procedure btnMatPriceINClick(Sender: TObject);
  private
    function CalcAmount: Currency;
  public
    Ftag: Integer;
    procedure init(ProdStr: string);
  end;

var
  frmMatPriceEdt: TfrmMatPriceEdt;

implementation

uses DM_u, ConstVar, Pick_Item_Single;

{$R *.dfm}

procedure TfrmMatPriceEdt.init(ProdStr: string);
begin
  lblProdName.Caption:= ProdStr;
  if Ftag = 0 then
  begin
    dm.aqCP140.Append;
  end
  else
  begin
    dm.aqCP140.Edit;
    if dm.CDS148.RecordCount > 0 then
    begin
      DBEdit2.Enabled:= False;
      DBEdit2.Color:= clScrollBar;
    end
    else
    begin
      DBEdit2.Enabled:= True;
      DBEdit2.Color:= clWindow;
    end;
  end;
end;

procedure TfrmMatPriceEdt.btnLookClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'INV_PART_NUMBER/物料代码/95,INV_NAME/物料名称/120,INV_DESCRIPTION/物料规格/180,STD_COST/单价/60,QUAN_ON_HAND/库存数量/65,类型/类型/65';
    //InputVar.Sqlstr := 'Select t17.RKEY,t17.INV_PART_NUMBER,t17.INV_NAME,t17.INV_DESCRIPTION,t17.STD_COST,t17.QUAN_ON_HAND,t17.QUAN_ASSIGN,t17.QUAN_ON_HAND,t2.UNIT_NAME From dbo.Data0017 t17 INNER JOIN dbo.Data0002 t2 ON t17.STOCK_UNIT_PTR = t2.RKEY';
    InputVar.Sqlstr := 'Select t17.RKEY,t17.INV_PART_NUMBER,t17.INV_NAME,t17.INV_DESCRIPTION,t17.STD_COST, ''0'' as invent_or,'
      + 't17.QUAN_ON_HAND,t2.UNIT_NAME, ''材料'' as 类型  From dbo.Data0017 t17 '
      + 'INNER JOIN dbo.Data0002 t2 ON t17.STOCK_UNIT_PTR = t2.RKEY '
      + 'union '
      + 'Select t08.rkey,t08.PROD_CODE,t08.PRODUCT_NAME,t08.PRODUCT_DESC,t08.new_price, ''1'' as invent_or,'
      + 't08.qty_onhand,t2.UNIT_NAME, ''半成品'' as 类型 From dbo.Data0008 t08 '
      + 'INNER JOIN dbo.Data0002 t2 ON t08.UNIT_PTR = t2.RKEY '
      + 'where t08.TTYPE=0 ';
    InputVar.InPut_value:= DBEdit3.Text;
    InputVar.KeyField:= 'INV_PART_NUMBER';
    InputVar.AdoConn:= DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if not DM.CDS148.Locate('INVENT_PTR;invent_or',VarArrayOf([frmPick_Item_Single.adsPick.FieldValues['RKEY'],frmPick_Item_Single.adsPick.FieldValues['invent_or']]),[]) then
      begin
        if not (DM.CDS148.State in[dsInsert, dsEdit]) then DM.CDS148.Insert;
        DM.CDS148rkey_cp140.Value:= DM.aqCP140rkey.Value;
        DM.CDS148INVENT_PTR.Value:= frmPick_Item_Single.adsPick.FieldValues['RKEY'];
        DM.CDS148INV_PART_NUMBER.Value:= frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER'];
        DM.CDS148INV_NAME.Value:= frmPick_Item_Single.adsPick.FieldValues['INV_NAME'];
        DM.CDS148INV_DESCRIPTION.Value:= frmPick_Item_Single.adsPick.FieldValues['INV_DESCRIPTION'];
        DM.CDS148UNIT_NAME.Value:= frmPick_Item_Single.adsPick.FieldValues['UNIT_NAME'];
        DM.CDS148STD_COST.Value:= frmPick_Item_Single.adsPick.FieldValues['STD_COST'];
        DM.CDS148QUAN_ON_HAND.Value:=frmPick_Item_Single.adsPick.FieldValues['QUAN_ON_HAND'];
        DM.CDS148invent_or.Value := frmPick_Item_Single.adsPick.FieldValues['invent_or'];
      end;
    end;
//    if not (DM.aqCP140.State in[dsInsert, dsEdit]) then DM.aqCP140.Edit;
//    DM.aqCP140amount.Value:= CalcAmount;
//    DBEdit2.Enabled:= False;
//    DBEdit2.Color:= clScrollBar;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmMatPriceEdt.BitBtn1Click(Sender: TObject);
begin
  dm.CDS148.Open;
  dm.CDS148.Append;
end;

procedure TfrmMatPriceEdt.BitBtn2Click(Sender: TObject);
begin
  dm.CDS148.Open;
  dm.CDS148.Edit;
end;

procedure TfrmMatPriceEdt.BitBtn3Click(Sender: TObject);
begin
  if ((dm.CDS148.Active) and (dm.CDS148.RecordCount>0)) then
  begin
    dm.CDS148.Delete;
    if not (DM.aqCP140.State in[dsInsert, dsEdit]) then DM.aqCP140.Edit;
    DM.aqCP140amount.Value:= CalcAmount;
    if dm.CDS148.RecordCount = 0 then
    begin
      DBEdit2.Enabled:= True;
      DBEdit2.Color:= clWindow;
    end;
  end;
end;

procedure TfrmMatPriceEdt.btnSaveClick(Sender: TObject);
begin
  if ((DM.aqCP140part_name.Value = '') or (DM.aqCP140amount.AsString = '')) then
  begin
    ShowMessage('报价分类名称或报价金额不能为空!');
    DBEdit1.SetFocus;
    Abort;
  end;
  if Ftag=0 then
  begin
    DM.Tmp.Close;
    DM.Tmp.SQL.Text:='select rkey from WZCP0140 where part_ptr = '+dm.D08RKEY.AsString+' and part_name= '''+DBEdit1.Text+'''' ;
    DM.Tmp.Open;
    if not DM.Tmp.IsEmpty then
    begin
      ShowMessage('报价分类名称重复,请您更改...');
      Abort;
    end;
  end;
  try
    dm.ADOCon.BeginTrans;
    dm.aqCP140part_ptr.Value:= dm.D08RKEY.Value;
    dm.aqCP140.UpdateBatch();

    DM.Tmp.Close;
    DM.Tmp.SQL.Clear;
    DM.Tmp.SQL.Text:='delete from WZCP0148 where rkey_cp140='+dm.aqCP140rkey.AsString;
    DM.Tmp.ExecSQL;

    dm.CDS148.First;
    if not aqCP148_s.Active then aqCP148_s.Open;
    while not dm.CDS148.Eof do
    begin
      aqCP148_s.Append;
      aqCP148_srkey_cp140.Value:= dm.aqCP140rkey.Value;
      aqCP148_sINVENT_PTR.Value:= dm.CDS148INVENT_PTR.Value;
      aqCP148_sQUAN_BOM.Value:= dm.CDS148QUAN_BOM.Value;
      aqCP148_sSTD_COST.Value:= dm.CDS148STD_COST.Value;
      aqCP148_sVENDOR.Value:= dm.CDS148VENDOR.Value;
      aqCP148_sinvent_or.Value := dm.CDS148invent_or.Value;
      dm.CDS148.Next;
    end;
    aqCP148_s.UpdateBatch();
    dm.ADOCon.CommitTrans;
    ModalResult:= mrOk;
  except
    on E: Exception do
    begin
      ShowMessage('数据保存失败:'+E.Message);
      dm.ADOCon.RollbackTrans;
    end;
  end;
end;

procedure TfrmMatPriceEdt.btnExitClick(Sender: TObject);
begin
  if MessageBox(Handle, '资料还未保存,确定退出吗?', '提示', MB_OKCANCEL + 
    MB_ICONQUESTION) = IDOK then
  begin
    dm.aqCP140.CancelBatch();
    dm.CDS148.Cancel;
    if aqCP148_s.Active then aqCP148_s.CancelBatch();
  end;
  ModalResult:= mrCancel;
end;

function TfrmMatPriceEdt.CalcAmount: Currency;
begin
  Result:= 0;
  if DM.CDS148.State in[dsInsert, dsEdit] then DM.CDS148.Post;
  DM.CDS148.First;
  while not DM.CDS148.Eof do
  begin
    Result:= Result + DM.CDS148QUAN_BOM.Value*DM.CDS148STD_COST.Value;
    DM.CDS148.Next;
  end;
end;

procedure TfrmMatPriceEdt.DBEdit6Exit(Sender: TObject);
begin
  if ((DM.aqCP140.State in [dsInsert, dsEdit]) and (DM.aqCP148.State in [dsInsert, dsEdit]) and (DBEdit6.Text<>'')) then
  begin
    if not (DM.aqCP140.State in[dsInsert, dsEdit]) then DM.aqCP140.Edit;
    DM.aqCP140amount.Value:= CalcAmount;
    DBEdit2.Enabled:= False;
    DBEdit2.Color:= clScrollBar;
  end;
end;

procedure TfrmMatPriceEdt.btnBOMINClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'PROD_CODE/产品编码/90,PRODUCT_NAME/产品名称/120,part_name/BOM名称/100,PRODUCT_DESC/产品规格/120,ttype_c/类别/50';
    InputVar.Sqlstr :=  'SELECT  dbo.Data0008.*,data0140.rkey as rkey140,data0140.part_name, dbo.Data0007.PR_GRP_CODE,'+#13
                        +'dbo.Data0007.PRODUCT_GROUP_NAME, dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NAME,' +#13
                        +'case when data0008.ttype=0 then ''半成品''  else ''成品'' end ttype_c'+#13
                        +'FROM  dbo.Data0008 inner join data0140 on data0008.rkey=data0140.part_ptr INNER JOIN'+#13
                        +'dbo.Data0007 ON dbo.Data0008.PR_GRP_POINTER = dbo.Data0007.RKEY INNER JOIN'+#13
                        +'dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY '+#13
                        +'where data0140.status=1 ';//+ QuotedStr(Edit2.Text);
    inputvar.KeyField:='PROD_CODE';

    InputVar.AdoConn := DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select * from vData0148 '+
      'where part_ptr='+frmPick_Item_Single.adsPick1.FieldByName('rkey140').AsString+
      ' order by rkey';
      DM.Tmp.Open;
      while not DM.Tmp.Eof do
      begin
        if DM.CDS148.Locate('INVENT_PTR;Invent_or',VarArrayOf([DM.Tmp.fieldbyname('INVENT_PTR').Value, DM.Tmp.fieldbyname('Invent_or').Value]),[]) then
        begin
          DM.Tmp.Next;
          continue;
        end;
        if not (DM.CDS148.State in[dsInsert, dsEdit]) then DM.CDS148.Insert;
        DM.CDS148rkey_cp140.Value:= DM.aqCP140rkey.Value;
        DM.CDS148INVENT_PTR.Value:= dm.Tmp.FieldByName('INVENT_PTR').AsInteger;
        DM.CDS148INV_PART_NUMBER.Value:= dm.Tmp.FieldByName('inv_part_number').AsString;
        DM.CDS148INV_NAME.Value:= dm.Tmp.FieldByName('inv_name').AsString;
        DM.CDS148INV_DESCRIPTION.Value:= dm.Tmp.FieldByName('INV_DESCRIPTION').AsString;
        DM.CDS148UNIT_NAME.Value:= dm.Tmp.FieldByName('unit_name').AsString;
        DM.CDS148STD_COST.Value:= dm.Tmp.FieldByName('STD_COST').AsFloat;
        DM.CDS148QUAN_BOM.Value:= dm.Tmp.FieldByName('QUAN_BOM').AsFloat;
        DM.CDS148invent_or.Value := dm.Tmp.FieldByName('invent_or').AsInteger;
        //ShowMessage(DM.aqCP148INV_PART_NUMBER.Value);
        DM.Tmp.Next;
      end;
      if not (DM.aqCP140.State in[dsInsert,dsEdit]) then DM.aqCP140.Edit;
      DM.aqCP140amount.Value:= CalcAmount;
      DBEdit2.Enabled:= False;
      DBEdit2.Color:= clScrollBar;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmMatPriceEdt.btnMatPriceINClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'PROD_CODE/产品编码/90,PRODUCT_NAME/产品名称/120,part_name/报价分类名称/100,PRODUCT_DESC/产品规格/120,ttype_c/类别/50';
    InputVar.Sqlstr :=  'SELECT  dbo.Data0008.*,WZCP0140.rkey as rkey140,WZCP0140.part_name, dbo.Data0007.PR_GRP_CODE,'+#13
                        +'dbo.Data0007.PRODUCT_GROUP_NAME, dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NAME,' +#13
                        +'case when data0008.ttype=0 then ''半成品''  else ''成品'' end ttype_c'+#13
                        +'FROM  dbo.Data0008 inner join WZCP0140 on data0008.rkey=WZCP0140.part_ptr INNER JOIN'+#13
                        +'dbo.Data0007 ON dbo.Data0008.PR_GRP_POINTER = dbo.Data0007.RKEY INNER JOIN'+#13
                        +'dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY '+#13
                        +'where WZCP0140.status=1 ';
    inputvar.KeyField:='PROD_CODE';
    InputVar.AdoConn:= DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
       DM.Tmp.Close;
       DM.Tmp.SQL.Text:='SELECT WZCP0148.*,d17.inv_part_number,d17.inv_name,d17.INV_DESCRIPTION,d02.unit_name '+
        'FROM dbo.WZCP0148 inner join data0017 d17 on WZCP0148.invent_ptr=d17.rkey inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.rkey '+
        'where WZCP0148.rkey_cp140='+frmPick_Item_Single.adsPick1.FieldByName('rkey140').AsString;
       DM.Tmp.Open;
       DM.Tmp.First;
       while not DM.Tmp.Eof do
        begin
          if DM.CDS148.Locate('INVENT_PTR;invent_or',VarArrayOf([DM.Tmp.fieldbyname('INVENT_PTR').Value, DM.Tmp.fieldbyname('invent_or').Value]),[]) then
          begin
            DM.Tmp.Next;
            continue;
          end;        
          if not (DM.CDS148.State in[dsInsert, dsEdit]) then DM.CDS148.Insert;
          DM.CDS148rkey_cp140.Value:= DM.aqCP140rkey.Value;
          DM.CDS148INVENT_PTR.Value:= dm.Tmp.FieldByName('INVENT_PTR').AsInteger;
          DM.CDS148INV_PART_NUMBER.Value:= dm.Tmp.FieldByName('INV_PART_NUMBER').AsString;
          DM.CDS148INV_NAME.Value:= dm.Tmp.FieldByName('INV_NAME').AsString;
          DM.CDS148INV_DESCRIPTION.Value:= dm.Tmp.FieldByName('INV_DESCRIPTION').AsString;
          DM.CDS148UNIT_NAME.Value:= dm.Tmp.FieldByName('UNIT_NAME').AsString;
          DM.CDS148STD_COST.Value:= dm.Tmp.FieldByName('STD_COST').AsFloat;
          DM.CDS148QUAN_BOM.Value:= dm.Tmp.FieldByName('QUAN_BOM').AsFloat;
          DM.CDS148invent_or.Value := dm.Tmp.FieldByName('invent_or').AsInteger;
          DM.Tmp.Next;
        end;
        if not (DM.aqCP140.State in[dsInsert,dsEdit]) then DM.aqCP140.Edit;
        DM.aqCP140amount.Value:= CalcAmount;
        DBEdit2.Enabled:= False;
        DBEdit2.Color:= clScrollBar;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

end.
