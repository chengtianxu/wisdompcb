unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, Grids, DBGridEh, StdCtrls, Provider,
  DBClient, Buttons, Math;
const vSQL = 'select CONTROL_NO_LENGTH,SEED_VALUE,SEED_FLAG,SYSDATE=getdate() from data0004 where rkey=5';
type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    adoConn: TADOConnection;
    aq1: TADOQuery;
    ds1: TDataSource;
    aq1rkey: TAutoIncField;
    aq1proc_ptr: TIntegerField;
    aq1location_ptr: TIntegerField;
    aq1qty_on_hand: TBCDField;
    aq1PROD_CODE: TStringField;
    aq1PRODUCT_NAME: TStringField;
    aq1PRODUCT_DESC: TStringField;
    aq1CODE: TStringField;
    aq1LOCATION: TStringField;
    aq1sel: TWordField;
    cds1: TClientDataSet;
    dp1: TDataSetProvider;
    cds1sel: TSmallintField;
    cds1rkey: TAutoIncField;
    cds1proc_ptr: TIntegerField;
    cds1location_ptr: TIntegerField;
    cds1qty_on_hand: TBCDField;
    cds1PROD_CODE: TStringField;
    cds1PRODUCT_NAME: TStringField;
    cds1PRODUCT_DESC: TStringField;
    cds1CODE: TStringField;
    cds1LOCATION: TStringField;
    aqTmp: TADOQuery;
    gbFrom: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    btnOrigProd: TBitBtn;
    gbTo: TGroupBox;
    lblProdName: TLabel;
    lblLocationName: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    btnReset: TBitBtn;
    btnOK: TBitBtn;
    btnNewProd: TBitBtn;
    btnNewLocation: TBitBtn;
    btnCancel: TBitBtn;
    DBGridEh1: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOrigProdClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Edit5Exit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cds1selChange(Sender: TField);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1Exit(Sender: TObject);
  private
    USERRKEY, rkey8, rkey16, QTY: Integer;
    vDT: TDateTime;
    PaperNo: string;
    procedure OpenOrigProd(Prod, Location: Integer);
    procedure SumQty;
    procedure Update_04(v_seed: string);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses common, ConstVar, Pick_Item_Single;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
{$IFDEF Release}
  if not App_init_2(adoConn) then
  begin
    showmsg('程序起动失败，请联系管理员！',1);
    application.Terminate;
  end;
{$ENDIF}
{$IFDEF Debug}
  adoConn.Connected:= False;
  adoConn.Connected:= True;
  vprev:= '4';  //4写银
  rkey73:='136';
{$ENDIF}
  self.caption:= Application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if adoConn.Connected then
  begin
    OpenQuery(aqTmp,'select employee_ptr from data0073 where rkey='+rkey73);
    USERRKEY:= aqTmp.Fields[0].AsInteger;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmMain.btnOrigProdClick(Sender: TObject);
var
  InputVar: PDlgInput;
  vEvent: TNotifyEvent;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'PROD_CODE/产品编码/110,PRODUCT_NAME/产品名称/251,'+
                        'PRODUCT_DESC/产品规格/251';
    InputVar.KeyField:='PROD_CODE';
    if (Sender as TBitBtn).Tag = 0 then
    begin
      InputVar.Sqlstr :=
        'Select distinct t8.RKEY,t8.PROD_CODE,t8.PRODUCT_NAME,t8.PRODUCT_DESC '+#13+
        'From Data0008 t8 INNER JOIN '+#13+
        'WZCP0001 t1 ON t1.proc_ptr = t8.RKEY '+#13+
        'WHERE t1.qty_on_hand <> 0';
      InputVar.InPut_value:=Edit1.Text;
    end
    else if (Sender as TBitBtn).Tag = 1 then
    begin
      InputVar.Sqlstr := 'Select RKEY,PROD_CODE,PRODUCT_NAME,PRODUCT_DESC From Data0008';
      InputVar.InPut_value:=Edit3.Text;
    end
    else
    begin
      InputVar.Sqlstr := 'Select RKEY,CODE,LOCATION,whouse_ptr From Data0016 Where LOCATION_TYPE = 1';
      InputVar.InPut_value:=Edit4.Text;
      InputVar.Fields := 'CODE/仓库代码/110,LOCATION/仓库名称/251';
      InputVar.KeyField:='CODE';
    end;
    InputVar.AdoConn := adoConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if (Sender as TBitBtn).Tag = 0 then
      begin
        vEvent:= Edit1.OnChange;
        Edit1.OnChange:= nil;
        Edit1.Text:= frmPick_Item_Single.adsPick.FieldByName('PROD_CODE').AsString;
        Edit2.Text:= '0';
        Edit1.OnChange:= vEvent;
        OpenOrigProd(frmPick_Item_Single.adsPick.FieldByName('RKEY').AsInteger,0);
      end
      else if (Sender as TBitBtn).Tag = 1 then
      begin
        Edit3.Text:= frmPick_Item_Single.adsPick.FieldByName('PROD_CODE').AsString;
        lblProdName.Caption:= frmPick_Item_Single.adsPick.FieldByName('PRODUCT_NAME').AsString;
        rkey8:= frmPick_Item_Single.adsPick.FieldByName('RKEY').AsInteger;
      end
      else
      begin
        Edit4.Text:= frmPick_Item_Single.adsPick.FieldByName('CODE').AsString;
        lblLocationName.Caption:= frmPick_Item_Single.adsPick.FieldByName('LOCATION').AsString;
        rkey16:= frmPick_Item_Single.adsPick.FieldByName('RKEY').AsInteger;
        //20170830tang修改从仓库取工厂Rkey
        Edit4.Tag:=frmPick_Item_Single.adsPick.FieldByName('whouse_ptr').AsInteger;
      end;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmMain.Edit1Change(Sender: TObject);
begin
  Edit2.Text:= '0';
  with aqTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select distinct t8.RKEY,t8.PROD_CODE,t8.PRODUCT_NAME,t8.PRODUCT_DESC ');
    SQL.Add('From Data0008 t8 INNER JOIN ');
    SQL.Add('WZCP0001 t1 ON t1.proc_ptr = t8.RKEY ');
    SQL.Add('WHERE t1.qty_on_hand <> 0 ');
    SQL.Add('AND t8.PROD_CODE = :PROD_CODE ');
    Parameters[0].Value:= Edit1.Text;
    Open;
  end;
  OpenOrigProd(aqTmp.FieldByName('RKEY').AsInteger,0);
end;

procedure TfrmMain.Edit2Change(Sender: TObject);
begin
  Edit5.Text:= Edit2.Text;
end;

procedure TfrmMain.Edit3Change(Sender: TObject);
begin
  with aqTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select RKEY,PROD_CODE,PRODUCT_NAME,PRODUCT_DESC From Data0008 ');
    SQL.Add('WHERE PROD_CODE = :PROD_CODE ');
    Parameters[0].Value:= Edit3.Text;
    Open;
  end;
  lblProdName.Caption:= aqTmp.FieldByName('PRODUCT_NAME').AsString;
  rkey8:= aqTmp.FieldByName('RKEY').AsInteger;
end;

procedure TfrmMain.Edit4Change(Sender: TObject);
begin
  with aqTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select RKEY,CODE,LOCATION From Data0016 ');
    SQL.Add('WHERE LOCATION_TYPE = 1 And CODE = :CODE ');
    Parameters[0].Value:= Edit4.Text;
    Open;
  end;
  lblLocationName.Caption:= aqTmp.FieldByName('LOCATION').AsString;
  rkey16:= aqTmp.FieldByName('RKEY').AsInteger;
end;

procedure TfrmMain.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#8]) then Key:= #0;
end;

procedure TfrmMain.Edit5ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  Handled:= True;  //屏蔽右键菜单
end;

procedure TfrmMain.Edit5Exit(Sender: TObject);
begin
  While Pos('0',Edit5.Text) = 1 do
  begin
    Edit5.Text:= Copy(Edit5.Text,2,Length(Edit5.Text));
  end;
end;

procedure TfrmMain.btnOKClick(Sender: TObject);
var
  i,rkey416: integer;
  vCpt: TComponent;
  procedure AppData(OrigRKEY8,OrigRKEY16,OrigQty,NewRKEY8,NewRKEY16:Integer);
  begin
    with aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='IF Exists(Select 1 From WZCP0001'
                        +' Where proc_ptr = '+inttostr(OrigRKEY8)
                        +' And location_ptr = '+inttostr(OrigRKEY16)
                        +' And qty_on_hand >= '+inttostr(OrigQty)+')'+#13
               +' Update WZCP0001 Set qty_on_hand = qty_on_hand - '+inttostr(OrigQty)
               +' Where proc_ptr = '+inttostr(OrigRKEY8)
               +' And location_ptr = '+inttostr(OrigRKEY16)+#13
               +'Else'+#13
               +' Raiserror 39999 ''库存不足''';
      ExecSQL;
    end;
    QTY:= QTY - OrigQty;
    
    with aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='IF Exists(Select 1 From WZCP0001'
                        +' Where proc_ptr = '+inttostr(NewRKEY8)
                        +' And location_ptr = '+inttostr(NewRKEY16)+')'+#13
               +' Update WZCP0001 Set qty_on_hand = qty_on_hand + '+inttostr(OrigQty)
               +' Where proc_ptr = '+inttostr(NewRKEY8)
               +' And location_ptr = '+inttostr(NewRKEY16)+#13
               +'Else'+#13
               +' Insert WZCP0001(proc_ptr,location_ptr,qty_on_hand)'+#13
               +' Values('+inttostr(NewRKEY8)+','+inttostr(NewRKEY16)+','+inttostr(OrigQty)+')';
      ExecSQL;
    end;

    with aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from data0113 where rkey = null');
      Open;
      Append;
      FieldByName('TRAN_TYPE').Value:= 2;  //成品转移
      FieldByName('SRCE_PTR').Value:= OrigRKEY16;
      FieldByName('DEST_PTR').Value:= OrigRKEY8;
      FieldByName('EMPL_PTR').Value:= USERRKEY;
      FieldByName('CSI_USER_PTR').Value:= rkey73;
      FieldByName('TDATE').Value:= vDT;
      FieldByName('QUANTITY').Value:= OrigQty;
      FieldByName('TO_LOC_PTR').Value:= NewRKEY16;
      FieldByName('TO_PROD_PTR').Value:= NewRKEY8;
      Post;
    end;
  end;
begin
  if not cds1.Active then Exit;
  OpenQuery(aqTmp,'Select 1 From Data0214 Where STATUS = 0');
  IF aqTmp.RecordCount > 0 then
  begin
    ShowMsg('成品盘点进行中,不可操作!',1);
    Abort;
  end;
  for i:=0 to ComponentCount-1 do
  begin
    vCpt:= Components[i];
    if vCpt.Tag <> 100 then Continue;
    if vCpt is TEdit then
    begin
      if (vCpt as TEdit).Text = '' then
      begin
        ShowMsg((vCpt as TEdit).Hint+'不能为空!',1);
        if (vCpt as TEdit).CanFocus then
          (vCpt as TEdit).SetFocus;
        Abort;
      end;
      if (vCpt as TEdit).Text = '0' then
      begin
        ShowMsg((vCpt as TEdit).Hint+'不能为零!',1);
        Abort;
      end;
    end;
    if vCpt is TLabel then
    begin
      if (vCpt as TLabel).Caption = '' then
      begin
        ShowMsg('错误的产品编码或仓库!',1);
        Abort;
      end;
    end;
  end;
//  if StrToFloat(Edit5.Text)>StrToFloat(Edit2.Text) then
//  begin
//    ShowMsg('转移数量不可大于可用数量!',1);
//    Edit5.SetFocus;
//    Abort;
//  end;
  if Edit1.Text = Edit3.Text then
  begin
    ShowMsg('转出与转入数据相同，请重新检查!',1);
    Edit3.SetFocus;
    Abort;
  end;
  QTY:= StrToInt(Edit5.Text);
  adoConn.BeginTrans;
  try
    OpenQuery(aqTmp,vSQL);
    PaperNo:= aqTmp.FieldByName('SEED_VALUE').AsString;
    vDT:= aqTmp.FieldByName('SYSDATE').AsDateTime;
    cds1.First;
    while not cds1.Eof do
    begin
      if cds1.FieldByName('sel').AsInteger = 1 then
      begin
        if cds1qty_on_hand.AsInteger > QTY then
          AppData(cds1proc_ptr.AsInteger,cds1location_ptr.AsInteger,QTY,
                  rkey8,rkey16)
        else
          AppData(cds1proc_ptr.AsInteger,cds1location_ptr.AsInteger,cds1qty_on_hand.AsInteger,
                  rkey8,rkey16);
        if QTY = 0 then Break;
      end;
      cds1.Next;
    end;

    with aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from data0416 where rkey = null');
      Open;
      Append;
      FieldByName('number').Value:= PaperNo;
      FieldByName('type').Value:= 5;  //成品转移入仓
      FieldByName('empl_ptr').Value:= USERRKEY;
      FieldByName('sys_date').Value:= vDT;
//      FieldByName('warehouse_ptr').Value:= 1;
//20170830tang修改从仓库取工厂Rkey
      FieldByName('warehouse_ptr').Value:= Edit4.Tag;
      FieldByName('quantity').Value:= Edit5.Text;
      FieldByName('reference').Value:= '';
      Post;
      rkey416:= aqTmp.FieldByName('rkey').AsInteger;
    end;
    with aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from data0053 where rkey = null');
      Open;
      Append;
      FieldByName('NPAD_PTR').Value:= rkey416;
      FieldByName('LOC_PTR').Value:= rkey16;
      FieldByName('CUST_PART_PTR').Value:= rkey8;
      FieldByName('QUANTITY').Value:= Edit5.Text;
      FieldByName('REFERENCE_NUMBER').Value:= '';
      FieldByName('price').Value:= 0;
      Post;
    end;
    with aqTmp do  //需同步更新Data0008表的当前库存
    begin
      Close;
      SQL.Clear;
      //update t8 set qty_onhand = d1.qty
      //from Data0008 t8 inner join (select proc_ptr,sum(isnull(qty_on_hand,0)) as qty
      //                             from wzcp0001 where proc_ptr in('142') group by proc_ptr) d1
      //on t8.RKEY = d1.proc_ptr
      SQL.Text:=' Update Data0008 Set qty_onhand = qty_onhand - '+Edit5.Text
               +' Where RKEY = '+ cds1proc_ptr.AsString;
      ExecSQL;
      SQL.Clear;
      SQL.Text:=' Update Data0008 Set qty_onhand = qty_onhand + '+Edit5.Text
               +' Where RKEY = '+ IntToStr(rkey8);
      ExecSQL;
    end;
    Update_04(trim(PaperNo));
    adoConn.CommitTrans;
    ShowMsg('转移成功!',1);
    btnReset.Click;
  except
    on E:exception do
    begin
      adoConn.RollbackTrans;
      ShowMsg('转移失败:'+E.Message,1);
    end;
  end;
end;

procedure TfrmMain.btnResetClick(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then (Components[i] as TEdit).Text:= '';
  end;
end;

procedure TfrmMain.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.cds1selChange(Sender: TField);
begin
  if cds1.FieldByName('sel').AsInteger = 1 then
    Edit2.Text:= FloatToStr(StrToFloat(Edit2.Text) + cds1.FieldByName('qty_on_hand').AsFloat)
  else
    Edit2.Text:= FloatToStr(StrToFloat(Edit2.Text) - cds1.FieldByName('qty_on_hand').AsFloat);
end;

procedure TfrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (Sender as TDBGridEh).DataSource.DataSet.Active then Abort;
  if key = 45 then Abort;  //Insert
  if Key = 46 then Abort;
  if ((key = 40) and ((Sender as TDBGridEh).DataSource.DataSet.RecNo =
                      (Sender as TDBGridEh).DataSource.DataSet.RecordCount)) then
    Abort;  //↓
  if ((key = 46) and (ssCtrl in shift)) then Abort;  //Ctrl+Delete
end;

procedure TfrmMain.DBGridEh1Exit(Sender: TObject);
begin
  SumQty;
end;

procedure TfrmMain.OpenOrigProd(Prod, Location: Integer);
begin
  aq1.close;
  aq1.Parameters[0].Value:= Prod;
  aq1.Parameters[1].Value:= Location;
  aq1.Parameters[2].Value:= Location;
  aq1.Open;
  cds1.close;
  cds1.Open;
end;

procedure TfrmMain.SumQty;
begin
  if cds1.Active then
  begin
    Edit2.Text:= '0';
    with cds1 do
    begin
      First;
      while not Eof do
      begin
        if cds1.FieldByName('sel').AsInteger = 1 then
          Edit2.Text:= FloatToStr(StrToFloat(Edit2.Text) + cds1.FieldByName('qty_on_hand').AsFloat);
        Next;
      end;
    end;
  end;
end;

procedure TfrmMain.Update_04(v_seed: string);
var
  i,v_length:integer;
  v_last,new_seed:string;
begin
  OpenQuery(aqTmp,vSQL);
  v_length := length(v_seed);
  for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
  begin
    v_last:= floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed:= copy(v_seed,1,i) + copy(v_last,i+1,v_length-i);
    aqTmp.Edit; //使前缀不变后缀加1
    aqTmp.FieldByName('SEED_VALUE').AsString:= new_seed;
    aqTmp.Post;
    break;
  end
  else
  if i=1 then //如果第一位仍然是数字
  begin
    v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
    new_seed := copy(v_last,2,v_length);
    aqTmp.Edit;
    aqTmp.FieldByName('SEED_VALUE').AsString:= new_seed;
    aqTmp.Post;
  end;
end;

end.
