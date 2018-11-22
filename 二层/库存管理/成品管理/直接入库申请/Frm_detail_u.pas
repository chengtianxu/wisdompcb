unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB, DBCtrlsEh;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    BtnSave: TBitBtn;
    MaskEdit1: TMaskEdit;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    LBSale: TLabel;
    LBDept: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Splitter2: TSplitter;
    Grd2: TDBGridEh;
    N3: TMenuItem;
    N2: TMenuItem;
    ADO04: TADOQuery;
    ADO04SEED_VALUE: TStringField;
    ADO04SEED_FLAG: TWordField;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N1Click(Sender: TObject);
    procedure update_04(v_seed: string);
  private

  public
    Ftag:integer;
    procedure initd;
  end;
var
  Frm_detail:TFrm_detail;
  function Power(x, y : extended) : extended;
implementation
  uses DM_u,common,Frm_Out_u;

{$R *.dfm}

procedure TFrm_detail.initd;
var i,j:integer;
begin
  if Ftag=0 then
  begin
   self.Caption:='入库单-新增';
   ado04.Close;
   ado04.Open;
   if self.ADO04SEED_FLAG.Value<>1 then
   begin
    MaskEdit1.Text:=self.ADO04SEED_VALUE.Value;
   end;
   if self.ADO04SEED_FLAG.Value=4 then
    MaskEdit1.ReadOnly:=true;

    DM.tmp.Close;
    DM.tmp.SQL.Text:='select getdate()';
    DM.tmp.Open;
    DM.ADO416_1.Close;
    DM.ADO416_1.Parameters[0].Value:=-1;
    DM.ADO416_1.Open;
    DM.ADO416_1.Append;
    DM.ADO416_1.FieldByName('type').AsInteger:=1;
    DM.ADO416_1.FieldByName('sys_date').AsDateTime:=DM.tmp.Fields[0].AsDateTime;

    DM.ADO53_1.Close;
    DM.ADO53_1.Parameters[0].Value:=-1;
    DM.ADO53_1.Open;
    DM.ADO53_2.Close;
    DM.ADO53_2.Parameters[0].Value:=-1;
    DM.ADO53_2.Open;
    N2.Enabled:=false;
    N3.Enabled:=false;
  end else begin
    MaskEdit1.ReadOnly:=true;
    DM.ADO416_1.Close;
    DM.ADO416_1.Parameters[0].Value:=DM.ADO416rkey.Value;
    DM.ADO416_1.Open;

    DM.ADO53_2.Close;
    DM.ADO53_2.Parameters[0].Value:=DM.ADO416rkey.Value;
    DM.ADO53_2.Open;
    MaskEdit1.Text:=DM.ADO416.Fieldbyname('number').AsString;
    if Ftag=1 then
    begin
      self.Caption:='入库单-修改';
      DM.ADO53_1.Close;
      DM.ADO53_1.Parameters[0].Value:=DM.ADO416rkey.Value;
      DM.ADO53_1.Open;
    end else if Ftag=2 then begin
      self.Caption:='入库单-查看';
      BtnSave.Enabled:=false;
      Grd2.ReadOnly:=true;
      PopupMenu1.Free;
    end;
  end;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var i:integer;
    sumAm:integer;
begin
  MaskEdit1.SetFocus;
  if DM.ADO53_1.IsEmpty then
  begin
    showmessage('不能保存空记录...');
    exit;
  end; 
  if MaskEdit1.Text='' then
  begin
    showmessage('入库单号不能为空...');
    exit;
  end;
  if Ftag=0 then
  begin
    ADO04.Close;
    ADO04.Open;
    if ADO04SEED_FLAG.Value<>1 then
     begin
      if MaskEdit1.Text<>ADO04SEED_VALUE.Value then
      begin
       if messagedlg('入仓单号已过期可能多人同时新增,是否自动更新编号为:'+
        ADO04SEED_VALUE.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
        MaskEdit1.Text:=ADO04SEED_VALUE.Value
       else
       begin
        MaskEdit1.SetFocus;
        exit;
       end;
      end;
     end
    else
    begin
     DM.tmp.SQL.Clear;
     dm.tmp.SQL.Text :=' select * from data0416 where number='+
                           #39+trim(MaskEdit1.Text)+#39;
     DM.tmp.Open;
     if not dm.tmp.Eof then
     begin
      messagedlg('入仓单号重复!请手工重新输入',mterror,[mbok],0);
      MaskEdit1.SetFocus;
      DM.tmp.Close;
      exit;
     end;
    end;
  end;
  DM.ADO416_1.Edit;
  DM.ADO416_1.FieldByName('type').AsInteger:=1;
  DM.ADO416_1.FieldByName('status').AsInteger:=0;
  DM.ADO416_1.FieldByName('empl_PTR').AsString:=user_ptr;

  DM.ADOCon.BeginTrans;
  try
    DM.ADO416_1.FieldByName('number').AsString:=MaskEdit1.Text;
    DM.ADO416_1.FieldByName('quantity').AsInteger:=1;
    DM.ADO416_1.Post;
    DM.ADO416_1.UpdateBatch(arAll);
    if Ftag=0 then
    begin
     self.update_04(ADO04SEED_VALUE.Value); //更新控制码 ,已04表值为准
    end;
    sumAm:=0;
    DM.ADO53_1.First;
    while not DM.ADO53_1.Eof do
    begin
      DM.ADO53_1.Edit;
      DM.ADO53_1.FieldByName('npad_ptr').AsInteger:=DM.ADO416_1.FieldByName('rkey').AsInteger;
      DM.ADO53_1.FieldByName('QTY_ALLOC').AsInteger:=DM.ADO53_1.FieldByName('quantity').AsInteger;
      DM.ADO53_1.FieldByName('mfg_date').AsDateTime:=DBDateTimeEditEh1.Field.AsDateTime;
      DM.ADO53_1.FieldByName('RMA_PTR').AsInteger:=3;
      sumAm:=sumAm+DM.ADO53_1.FieldByName('quantity').AsInteger;
      DM.ADO53_1.Post;
      DM.ADO53_1.Next;
    end;
    DM.ADO53_1.UpdateBatch(arAll);
    DM.tmp.Close;
    DM.tmp.SQL.Text:='update data0416 set quantity='+inttostr(sumAm)+' where rkey='+DM.ADO416_1.FieldByName('rkey').AsString;
    DM.tmp.ExecSQL;

    DM.ADOCon.CommitTrans;
    Frkey416:=DM.ADO416_1.FieldByName('rkey').asinteger;
    Ftag:=2;
    modalresult:=mrok;
  except
    on e:exception do
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('保存数据失败:'+e.Message);
    end;
  end;
end;

procedure TFrm_detail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true)
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=(Ftag=2) or (Application.MessageBox('确认不保存退出吗?', PChar('提示'),MB_YESNO)=6);
end;

procedure TFrm_detail.N1Click(Sender: TObject);
begin
  case  TComponent(Sender).Tag of
  0,1:
    try
      Frm_out:=TFrm_out.Create(nil);
      if TComponent(Sender).Tag=1 then
      begin
        Frm_out.EdtPart1.Text:=DM.ADO53_2.fieldbyname('MANU_PART_NUMBER').AsString;
        Frm_out.EdtPart1.tag:=DM.ADO53_2.fieldbyname('CUST_PART_PTR').AsInteger;
        Frm_out.EdtCustPart1.Text:=DM.ADO53_2.fieldbyname('MANU_PART_DESC').AsString;

        Frm_out.EdtFac1.Text:=DM.ADO53_2.fieldbyname('WAREHOUSE_CODE').AsString;
        Frm_out.EdtFac1.Tag:=DM.ADO53_2.fieldbyname('WHSE_PTR').AsInteger;
        Frm_out.LBfac1.Caption:=DM.ADO53_2.fieldbyname('WAREHOUSE_name').AsString;
        Frm_out.EdtStore1.Text:=DM.ADO53_2.fieldbyname('code').AsString;
        Frm_out.EdtStore1.Tag:=DM.ADO53_2.fieldbyname('loc_ptr').AsInteger;
        Frm_out.LBstore1.Caption:=DM.ADO53_2.fieldbyname('LOCATION').AsString;

        Frm_out.Edit12.Text:=DM.ADO53_2.fieldbyname('QUANTITY').AsString;
        Frm_out.Edit14.Text:=DM.ADO53_2.fieldbyname('REFERENCE_NUMBER').AsString;
      end;
      if Frm_out.ShowModal=mrok then
      begin
        if TComponent(Sender).Tag=0 then
        begin
          DM.ADO53_2.Append;
          DM.ADO53_1.Append;
        end else begin
          if not DM.ADO53_1.Locate('CUST_PART_PTR;WHSE_PTR;LOC_PTR',VarArrayOf([DM.ADO53_2.fieldbyname('CUST_PART_PTR').AsInteger,DM.ADO53_2.fieldbyname('WHSE_PTR').AsInteger, DM.ADO53_2.fieldbyname('LOC_PTR').AsInteger]),[]) then
          begin
            showmessage('系统错误,请重新进入再编辑');
            close;
            exit;
          end;
          DM.ADO53_2.Edit;
          DM.ADO53_1.Edit;
        end;
        DM.ADO53_2.fieldbyname('MANU_PART_NUMBER').AsString:=Frm_out.EdtPart1.Text;
        DM.ADO53_2.fieldbyname('CUST_PART_PTR').AsInteger:=Frm_out.EdtPart1.tag;
        DM.ADO53_2.fieldbyname('MANU_PART_DESC').AsString:=Frm_out.EdtCustPart1.Text;
        DM.ADO53_2.fieldbyname('WAREHOUSE_CODE').AsString:=Frm_out.EdtFac1.Text;
        DM.ADO53_2.fieldbyname('WHSE_PTR').AsInteger:=Frm_out.EdtFac1.Tag;
        DM.ADO53_2.fieldbyname('WAREHOUSE_name').AsString:=Frm_out.LBfac1.Caption;
        DM.ADO53_2.fieldbyname('code').AsString:=Frm_out.EdtStore1.Text;
        DM.ADO53_2.fieldbyname('loc_ptr').AsInteger:=Frm_out.EdtStore1.Tag;
        DM.ADO53_2.fieldbyname('LOCATION').AsString:=Frm_out.LBstore1.Caption;
        DM.ADO53_2.fieldbyname('QUANTITY').AsString:=Frm_out.Edit12.Text;
        DM.ADO53_2.fieldbyname('REFERENCE_NUMBER').AsString:=Frm_out.Edit14.Text;
        DM.ADO53_2.Post;
        DM.ADO53_1.fieldbyname('CUST_PART_PTR').AsInteger:=Frm_out.EdtPart1.tag;
        DM.ADO53_1.fieldbyname('WHSE_PTR').AsInteger:=Frm_out.EdtFac1.Tag;
        DM.ADO53_1.fieldbyname('loc_ptr').AsInteger:=Frm_out.EdtStore1.Tag;
        DM.ADO53_1.fieldbyname('QUANTITY').AsString:=Frm_out.Edit12.Text;
        DM.ADO53_1.fieldbyname('REFERENCE_NUMBER').AsString:=Frm_out.Edit14.Text;
        DM.ADO53_1.Post;        
      end;
    finally
      Frm_out.Free;
    end;
  2:begin
      if not DM.ADO53_1.Locate('CUST_PART_PTR;WHSE_PTR;LOC_PTR',VarArrayOf([DM.ADO53_2.fieldbyname('CUST_PART_PTR').AsInteger,DM.ADO53_2.fieldbyname('WHSE_PTR').AsInteger, DM.ADO53_2.fieldbyname('LOC_PTR').AsInteger]),[]) then
      begin
        showmessage('系统错误,请重新进入再编辑');
        close;
        exit;
      end;
      DM.ADO53_1.Delete;
      DM.ADO53_2.Delete;
    end;
  end;
  N2.Enabled:=not DM.ADO53_2.IsEmpty;
  N3.Enabled:=N2.Enabled;
end;

procedure TFrm_detail.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 ado04.Close;
 ado04.Open;
 if self.ADO04SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    Ado04.Edit; //使前缀不变后缀加1
    self.ADO04SEED_VALUE.Value := new_seed;
    Ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     Ado04.Edit;
     self.ADO04SEED_VALUE.Value := new_seed;
     Ado04.Post;
    end;
 end;
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

end.
