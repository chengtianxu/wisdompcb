unit Frm_Out_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFrm_out = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    LBfac1: TLabel;
    LBStore1: TLabel;
    Label24: TLabel;
    EdtPart1: TEdit;
    EdtCustPart1: TEdit;
    EdtFac1: TEdit;
    EdtStore1: TEdit;
    Edit12: TEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Edit14: TEdit;
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure EdtPart1Enter(Sender: TObject);
    procedure EdtPart1Exit(Sender: TObject);
    procedure EdtFac1Enter(Sender: TObject);
    procedure EdtFac1Exit(Sender: TObject);
    procedure EdtStore1Enter(Sender: TObject);
    procedure EdtStore1Exit(Sender: TObject);
  private
    FEdtPart1,FEdtFac1,FEdtStore1:string;
    FinValid:boolean;
  public
    FQty:integer;
  end;

var
  Frm_out: TFrm_out;

implementation
uses DM_u, common,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_out.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then abort;
end;

procedure TFrm_out.BitBtn2Click(Sender: TObject);
begin
  if trim(EdtPart1.Text)='' then
  begin
    showmessage('产品编码不能为空...');
    EdtPart1.SetFocus;
    exit;
  end;
  if trim(EdtFac1.Text)='' then
  begin
    showmessage('工厂代码不能为空...');
    EdtFac1.SetFocus;
    exit;
  end;
  if trim(EdtStore1.Text)='' then
  begin
    showmessage('仓库不能为空...');
    EdtStore1.SetFocus;
    exit;
  end;
  if strtofloat('0'+trim(edit12.Text))=0 then
  begin
    showmessage('入库数量不能为0...');
    edit12.SetFocus;
    exit;
  end;

  modalresult:=mrok;
end;

procedure TFrm_out.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true) ;
end;

procedure TFrm_out.BitBtn5Click(Sender: TObject);
var InputVar: PDlgInput ;
           s:string;
           i:integer;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    4:
    begin
      InputVar.Fields := 'manu_part_number/本厂编号/100,manu_part_desc/客户型号/150,ttype/类别/150';
      InputVar.Sqlstr :='select rkey,manu_part_number,manu_part_desc, customer_ptr, case data0025.ttype '+
                        'when 0 then ''批量'' when 1 then ''样板''  end ttype from  data0025 '+
                        'where data0025.PARENT_PTR is null  '+
                        'order by manu_part_number';
      inputvar.KeyField:='manu_part_number';
      inputvar.InPut_value:=EdtPart1.Text;
    end;
    5:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/150,WAREHOUSE_NAME/工厂名称/200';
      InputVar.Sqlstr :='SELECT RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME FROM Data0015 ORDER BY  WAREHOUSE_CODE';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;
    6:
    begin
      if EdtFac1.Text<>'' then s:=' and data0015.rkey='+inttostr(EdtFac1.tag);
      InputVar.Fields := 'CODE/仓库代码/150,WAREHOUSE_CODE/工厂代码/150,LOCATION/仓库名称/200';
      InputVar.Sqlstr :='SELECT data0016.RKEY,CODE,LOCATION ,whouse_ptr,warehouse_code,warehouse_name '+
                      'FROM Data0016 inner join data0015 on whouse_ptr=data0015.rkey where data0016.location_type=1 '+s+
                      ' ORDER BY  CODE' ;
      inputvar.KeyField:='CODE';
    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     4:begin
         EdtPart1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_number']);
         EdtPart1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         EdtCustPart1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_desc']);
       end;
     5:begin
         Edtfac1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         Edtfac1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         LBfac1.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_Name']);
         Edtstore1.Text:='';
         LBstore1.Caption:='';
       end;
     6:begin
         Edtstore1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         Edtstore1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         LBstore1.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['LOCATION']);

         Edtfac1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         Edtfac1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('whouse_ptr').AsInteger;
         LBfac1.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_Name']);
       end;
    end;
  end else case Tcomponent(Sender).Tag of
     4: begin EdtPart1.SetFocus;FEdtPart1:='';end;
     5: begin Edtfac1.SetFocus;FEdtfac1:='';end;
     6: begin Edtstore1.SetFocus;FEdtstore1:='';end;
  end;
 finally
   frmPick_Item_Single.Free ;
 end;

end;

procedure TFrm_out.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then abort;
end;

procedure TFrm_out.EdtPart1Enter(Sender: TObject);
begin
  FEdtPart1:=EdtPart1.Text;
end;

procedure TFrm_out.EdtPart1Exit(Sender: TObject);
var s,srkey10:string;
begin
  if (FEdtPart1<>EdtPart1.Text) and (EdtPart1.Text<>'') and (self.ActiveControl<>BitBtn5) then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text :='select rkey,manu_part_number,manu_part_desc, customer_ptr from  data0025 '+
                      'where manu_part_number='''+EdtPart1.Text+''' and data0025.PARENT_PTR is null';

    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('本厂编号不正确,请重新输入或选择',mtinformation,[mbok],0);
      EdtPart1.SetFocus;
      FEdtPart1:='';
      FinValid:=true;
      abort;
    end else begin
      EdtPart1.Text:=trim(DM.tmp.FieldValues['manu_part_number']);
      EdtPart1.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      EdtCustPart1.Text:=trim(DM.tmp.FieldValues['manu_part_desc']);
      FinValid:=false;
    end;
  end;


end;

procedure TFrm_out.EdtFac1Enter(Sender: TObject);
begin
  FEdtFac1:=EdtFac1.Text;
end;

procedure TFrm_out.EdtFac1Exit(Sender: TObject);
begin
  if (FEdtFac1<>EdtFac1.Text) and (EdtFac1.Text<>'') and (self.ActiveControl<>BitBtn6) then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME FROM Data0015 where WAREHOUSE_CODE='''+EdtFac1.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('工厂代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      EdtFac1.SetFocus;
      FEdtFac1:='';
      FinValid:=true;
      abort;
    end else begin
      Edtfac1.Text:=trim(DM.tmp.FieldValues['WAREHOUSE_CODE']);
      Edtfac1.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      LBfac1.Caption:=trim(DM.tmp.FieldValues['WAREHOUSE_Name']);
      FinValid:=false;
      Edtstore1.Text:='';
      LBstore1.Caption:='';
    end;
  end;
end;

procedure TFrm_out.EdtStore1Enter(Sender: TObject);
begin
  FEdtStore1:=EdtStore1.Text;
end;

procedure TFrm_out.EdtStore1Exit(Sender: TObject);
var s:string;
begin
  if (FEdtStore1<>EdtStore1.Text) and (EdtStore1.Text<>'') and (self.ActiveControl<>BitBtn7) then
  begin
    if EdtFac1.Text<>'' then
      s:=' and data0015.rkey='+inttostr(EdtFac1.tag);

    DM.tmp.Close;
    DM.tmp.SQL.Text :='SELECT data0016.RKEY,data0016.CODE,data0016.LOCATION,data0015.RKEY rkey15, data0015.WAREHOUSE_CODE , data0015.WAREHOUSE_NAME '+
                      'FROM Data0016 inner join data0015 on whouse_ptr=data0015.rkey '+s+
                      ' where data0016.location_type=1 and data0016.CODE='''+EdtStore1.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('仓库代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      EdtStore1.SetFocus;
      FEdtStore1:='';
      FinValid:=true;
      abort;
    end else begin
      Edtstore1.Text:=trim(DM.tmp.FieldValues['CODE']);
      Edtstore1.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      LBstore1.Caption:=trim(DM.tmp.FieldValues['LOCATION']);
      if EdtFac1.Text='' then
      begin
        Edtfac1.Text:=trim(DM.tmp.FieldValues['WAREHOUSE_CODE']);
        Edtfac1.tag:=DM.tmp.Fieldbyname('rkey15').AsInteger;
        LBfac1.Caption:=trim(DM.tmp.FieldValues['WAREHOUSE_Name']);
      end;
      FinValid:=false;
    end;
  end;

end;

end.
