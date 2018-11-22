unit frm_edit_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, DBGrids,ADODB, Grids,DB,
  Mask;

type
    TFrm_Edit = class(TForm) 
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    SpeedButton4: TSpeedButton;
    Label_submitperson: TLabel;
    Label_submitdet: TLabel;
    RichEdit2: TRichEdit;
    Label16: TLabel;
    Edit9: TEdit;
    pnl1: TPanel;
    pnl2: TPanel;
    Label_542rkey: TLabel;
    Label_544deptstr: TLabel;
    BitBtn3: TBitBtn;
    Edit5: TEdit;
    Label6: TLabel;
    rkey25: TLabel;
    Edit6: TEdit;
    BitBtn6: TBitBtn;
    Label7: TLabel;
    rkey34: TLabel;
    Label8: TLabel;
    Label20: TLabel;
    DBGrid3: TDBGrid;
    group_ptr: TLabel;
    rkey17: TLabel;
    Edit7: TEdit;
    Label12: TLabel;
    Edit8: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    RichEdit1: TRichEdit;
    Label13: TLabel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure update_04(v_seed:string);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure get_value(rkey278: integer);
    function Get17Group_ptr(const strRkey: string): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Edit: TFrm_Edit;
function Power(x, y : extended) : extended;


implementation
 uses common,demo,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_Edit.SpeedButton3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

  try
    if TComponent(Sender).Tag=0 then
    begin
     
      InputVar.Fields := 'INV_PART_NUMBER/材料编码/100,INV_NAME/材料名称/100,'+
                        'INV_DESCRIPTION/材料规格/120,QUAN_ON_HAND2/当前库存/55,'+
                        'unit_name/单位/30,ABBR_NAME/供应商/80,LOCATION/仓库/45,SUPPLIER2/原供应商/50,BARCODE_ID/备注/80,'+
                        'XY_1/库存类型/80,all_QUAN_ON_HAND/当前总库存/60,LEN_SIZE/余料经向/60,WEI_SIZE/余料纬向/60';
      InputVar.Sqlstr :='SELECT TOP (100) PERCENT dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,'+#13+
      ' Data0017.INV_NAME,data0017.INV_DESCRIPTION,data0017.GROUP_PTR,data0023.code,Data0023.RKEY as rkey23,'+#13+
      'SUM(dbo.Data0022.QUAN_ON_HAND - dbo.Data0022.QUAN_TO_BE_STOCKED) AS QUAN_ON_HAND2,'+#13+
      'dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.Data0016.LOCATION,'+#13+
      'data0022.SUPPLIER2,data0022.BARCODE_ID,''普通库存'' AS XY_1,dbo.Data0017.QUAN_ON_HAND as all_QUAN_ON_HAND,0 as LEN_SIZE,0 as WEI_SIZE'+#13+
      'FROM         dbo.Data0017 INNER JOIN'+#13+
      '    dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN'+#13+
      '    dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+#13+
      '    dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'+#13+
      '    dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'+#13+
      '    dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN '+#13+
      '    dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY '+#13+
      'WHERE    data0017.GROUP_PTR in(100,104,106,102,112,197,196,198)'+#13+
      'GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'+#13+
      ' dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.Data0016.LOCATION,data0017.INV_DESCRIPTION,data0017.GROUP_PTR,'+#13+
      'data0022.SUPPLIER2,data0022.BARCODE_ID,data0023.code,Data0023.RKEY,dbo.Data0017.QUAN_ON_HAND'+#13+
      'union all'+#13+
    'SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'+#13+
    '  dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.GROUP_PTR,'+#13+
    '  dbo.Data0023.CODE, dbo.Data0023.RKEY AS rkey23,'+#13+
    '  SUM(dbo.DATA0134.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,'+#13+
    '  dbo.Data0016.LOCATION, dbo.DATA0134.SUPPLIER2, dbo.DATA0134.BARCODE_ID,''VMI库存'' AS XY_1,SUM(dbo.DATA0134.QUAN_ON_HAND) AS Qty,0 as LEN_SIZE ,0 as WEI_SIZE '+#13+
    'FROM         dbo.DATA0134 INNER JOIN'+#13+
    '      dbo.DATA0133 ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER JOIN'+#13+
    '      dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'+#13+
    '      dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'+#13+
    '      dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'+#13+
    '      dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'+#13+
    '      dbo.Data0001 ON dbo.DATA0133.currency_ptr = dbo.Data0001.RKEY INNER JOIN'+#13+
    '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY'+#13+
    'WHERE    data0017.GROUP_PTR in(100,104,106,102,112,197,196,198)'+#13+
    'GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'+#13+
    ' dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.GROUP_PTR,'+#13+
    ' dbo.Data0023.CODE, dbo.Data0023.RKEY, dbo.Data0002.UNIT_NAME,'+#13+
    ' dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION, dbo.DATA0134.SUPPLIER2, dbo.DATA0134.BARCODE_ID,dbo.Data0017.QUAN_ON_HAND'+#13+

    'union all'+#13+
    'SELECT  dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,'+#13+
    'Data0017.INV_NAME,data0017.INV_DESCRIPTION,data0017.GROUP_PTR,data0023.code,Data0023.RKEY as rkey23,'+#13+
    'dbo.Data0556.QUAN_ON_HAND as QUAN_ON_HAND2 ,'+#13+
    'dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.Data0016.LOCATION,'+#13+
    'Data0556.REMARK,Data0558.remark,''余料库存'' AS XY_1,dbo.Data0556.QUAN_ON_HAND as QUAN_ON_HAND2,dbo.Data0556.LEN_SIZE,dbo.Data0556.WEI_SIZE'+#13+
    'FROM         dbo.Data0017 INNER JOIN'+#13+
    'dbo.Data0556 ON dbo.Data0017.RKEY = dbo.Data0556.RKEY17 INNER JOIN'+#13+
    'dbo.Data0557 ON dbo.Data0557.D556_PTR = dbo.Data0556.RKEY INNER JOIN'+#13+
    'dbo.Data0558 ON dbo.Data0557.D558_PTR = dbo.Data0558.RKEY INNER JOIN'+#13+
    'dbo.Data0016 ON dbo.Data0558.RKEY16 = dbo.Data0016.RKEY left join'+#13+
    'dbo.Data0023 ON dbo.data0556.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'+#13+
    'dbo.Data0002 ON data0017.stock_unit_ptr=dbo.Data0002.rkey'+#13+
    'WHERE   (dbo.Data0556.QUAN_ON_HAND > 0) and dbo.Data0556.Status=1'+#13+
    'GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'+#13+
    'dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.Data0016.LOCATION,data0017.INV_DESCRIPTION,data0017.GROUP_PTR,'+#13+
    'Data0556.REMARK,Data0558.remark,data0023.code,Data0023.RKEY,dbo.Data0556.QUAN_ON_HAND,dbo.Data0017.QUAN_ON_HAND,dbo.Data0556.LEN_SIZE,dbo.Data0556.WEI_SIZE'+#13+
    'ORDER BY dbo.Data0017.INV_PART_NUMBER' ;
    end;
     if TComponent(Sender).Tag =1 then
     begin
      frmPick_Item_Single.Width :=800;
      frmPick_Item_Single.Height :=600;
       InputVar.Fields := 'type_code/审批代码/80,name/审批流程名称/100,dept_name/审批流程/650';
       InputVar.Sqlstr :=dm.Queryofbp.SQL.Text;
     end;
     if TComponent(Sender).Tag=2 then
     begin
      InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/110,MANU_PART_DESC/客户型号/200';
      InputVar.Sqlstr :=
                      'SELECT     MANU_PART_NUMBER, MANU_PART_DESC, RKEY'+#13+
                      'FROM         dbo.Data0025'+#13+
                     ' order by manu_part_number';
     end;
     if TComponent(Sender).Tag =3 then
     begin
      InputVar.Fields :='DEPT_CODE/工序代码/110,DEPT_NAME/工序名称/251,'+
                        'STEP_NUMBER/步骤/80';

      InputVar.Sqlstr :='SELECT TOP 100 PERCENT Data0034.DEPT_CODE, Data0034.DEPT_NAME,'+#13+
      'Data0038.STEP_NUMBER, Data0034.RKEY'+#13+
      'FROM         dbo.Data0038 INNER JOIN'+#13+
      ' dbo.Data0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY'+#13+
      'WHERE  (dbo.Data0034.IS_COST_DEPT = 1) and'+#13+
      '(dbo.Data0038.SOURCE_PTR ='+rkey25.caption+')'+#13+
      'ORDER BY dbo.Data0038.STEP_NUMBER';
     end;
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;

    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if TComponent(Sender).Tag=0 then
      begin
        edit2.Text :=  frmPick_Item_Single.adsPick.Fieldbyname('INV_NAME').AsString;;
        edit3.Text := frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER'];
        edit9.Text := frmPick_Item_Single.adsPick.Fieldbyname('INV_DESCRIPTION').AsString;
        group_ptr.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('GROUP_PTR').AsString;
        Label13.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('unit_name').AsString;
        rkey17.Caption:= frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
        Label15.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('ABBR_NAME').AsString;

      end;
     if TComponent(Sender).Tag=1 then
      begin
        edit4.Text := frmPick_Item_Single.adsPick.FieldValues['name'];
        Label_542rkey.Caption:=frmPick_Item_Single.adsPick.FieldValues['d542_ptr'];
        Label_544deptstr.Caption :=frmPick_Item_Single.adsPick.FieldValues['dept_name'];
      end;
      if TComponent(Sender).Tag=2 then
      begin
       Edit6.Text:=frmPick_Item_Single.adsPick.FieldValues['manu_part_number'];
       rkey25.Caption := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
      end;
      if TComponent(Sender).Tag=3 then
      begin
        Edit5.Text:=frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE'];
        label8.Caption := frmPick_Item_Single.adsPick.Fieldbyname('DEPT_NAME').AsString;
        rkey34.Caption := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
        edit7.Text:=frmPick_Item_Single.adsPick.Fieldbyname('STEP_NUMBER').AsString;
       dm.ads494.Close;
       dm.ads494.CommandText:=dm.ads494SQL+' and data0494.step_number=:step_number';                      //制程参数
       dm.ads494.Parameters[0].Value:=rkey25.Caption;
       dm.ads494.Parameters[1].Value:=edit7.Text;
       dm.ads494.Open;
      end;
    end;

  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;


end;

procedure TFrm_Edit.SpeedButton1Click(Sender: TObject);
begin
   label_submitperson.Caption:=inttostr(demo.op_people);
   label_submitdet.Caption:=inttostr(demo.people_department);
  if  Edit8.Text='' then
  begin
    showmessage('配额不能为空...');
    Edit8.SetFocus;
    exit;
  end;

    if  Edit4.Text='' then
  begin
    showmessage('审批流程不能为空...');
    Edit4.SetFocus;
    exit;
  end;
     if  RichEdit2.Text='' then
  begin
    showmessage('请备注MI参数...');
    RichEdit2.SetFocus;
    exit;
  end;
  
    dm.ADS541.Close;
    DM.ADS541.Open;
    dm.ADS541.Append;
    dm.ADS541MATERIAL_REPLACE_NO.Value:=Edit1.Text;
    dm.ADS541INVT_PTR.AsString:=rkey17.Caption;
    dm.ADS541d05_ptr.AsString:=user_ptr;
    dm.ADS541submit_date.Value:=getsystem_date(dm.ADOTMP1,0);
    dm.ADS541d25_rkey.AsString:=rkey25.Caption;
    dm.ADS541check_status.Value:=0;
    dm.ADS541remark.AsString:=RichEdit2.Text;
    dm.ADS541R34_ptr.AsString:=rkey34.Caption;
    DM.ADS541check_type.AsString:=Label_542rkey.Caption;
    dm.ADS541QUAN_ON_HAND.AsString:=Edit8.Text;
    dm.ADS541beizhu.AsString:=Label15.Caption;
    dm.ADS541reason.AsString:=RichEdit1.Text;
    DM.ADS541circle.Value:=1;
    
    dm.ADS541.Post;

 try
  dm.ADOTMP1.ExecSQL;
  dm.ADOD04.Close;
  dm.ADOD04.Open;
 if dm.ADOD04SEED_FLAG.Value<>1 then
   self.update_04(trim(dm.ADOD04SEED_VALUE.Value));
  modalresult:=mrok;
 except
    on E: Exception do
   begin
      showmessage('数据保存发生错误:'+E.Message);
   end;
 end;

end ;
procedure TFrm_Edit.Button1Click(Sender: TObject);
begin
dm.ADOTMP1.Close;
dm.ADOTMP1.SQL.Clear;
dm.ADOTMP1.SQL.Text:='' ;
end;

procedure TFrm_Edit.SpeedButton2Click(Sender: TObject);
begin
close;
end;
procedure TFrm_Edit.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.adod04.Edit; //使前缀不变后缀加1
    dm.adod04SEED_VALUE.Value := new_seed;
    dm.adod04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.adod04.Edit;
     dm.adod04SEED_VALUE.Value := new_seed;
     dm.adod04.Post;
    end;
end;

function Power(x, y : extended) : extended;
begin
result := exp(y*ln(x));
end;


procedure TFrm_Edit.btn1Click(Sender: TObject);
begin
if Edit4.Text='' then
  begin
    showmessage('审核流程不能为空...');
    Edit4.SetFocus;
    exit;
  end;

  try
   dm.ADOTMP1.SQL.Clear;
   dm.ADOTMP1.SQL.Text:=      ' ' ;
    dm.ADOTMP1.ExecSQL;
    ShowMessage('保存成功');
   except
     ShowMessage('流程定义失败');
   end;
end;
function TFrm_Edit.Get17Group_ptr(const strRkey:string):Integer;
var tmpAdo:TADOQuery;
begin
   try
     try
       tmpAdo:=TADOQuery.Create(Application);
       tmpAdo.Connection:=DM.ADOConnection1;
       tmpAdo.Close;
       tmpAdo.SQL.Clear;
       tmpAdo.SQL.Add('select * from dbo.data0017 where Rkey=:Rkey');
       tmpAdo.Parameters.ParamByName('Rkey').Value:=strRkey;
       tmpAdo.Open;
       if (tmpAdo.RecordCount>0) then
       begin
         Result:=tmpAdo.FieldByName('GROUP_PTR').AsInteger;
       end else Result:=0;
     except
       Result:=0;
       tmpAdo.Close;
       tmpAdo.Connection:=nil;
       tmpAdo.Free;
     end;
   finally
     tmpAdo.Close;
     tmpAdo.Connection:=nil;
     tmpAdo.Free;
   end;
end;

procedure TFrm_Edit.FormShow(Sender: TObject);
var iGRoup:Integer;
begin

   if (edit9.Text<>'') then
   begin
      dm.ads494.Close;
      dm.ads494.CommandText:=dm.ads494SQL+' and data0038.dept_ptr=:dept_ptr';                      //制程参数
      dm.ads494.Parameters[0].Value:=dm.ADO541d025_rkey.Value;
      dm.ads494.Parameters[1].Value:=dm.ADO541R34_ptr.Value;
      dm.ads494.Open;
   end else
   begin
      dm.ads494.Close;
      dm.ads494.CommandText:=dm.ads494SQL+' and data0038.dept_ptr=:dept_ptr';                      //制程参数
      dm.ads494.Parameters[0].Value:=-1;
      dm.ads494.Parameters[1].Value:=-1;
      dm.ads494.Open;
   end;

end;
 procedure  TFrm_Edit.get_value(rkey278:integer);
begin
  with dm.ADOTMP1 do
   begin
    close;
    sql.Clear;
    sql.Add('select tvalue from data0338 where parameter_ptr='+inttostr(rkey278));
    open;
   end;
  if not dm.ADOTMP1.IsEmpty then
   begin
    dbgrid3.Columns[5].PickList.Clear;
    while not dm.ADOTMP1.eof do
     begin
     dbgrid3.Columns[5].PickList.Add(trim(dm.ADOTMP1.FieldValues['tvalue']));
      dm.ADOTMP1.Next;
     end;
   end
  else
   dbgrid3.Columns[5].PickList.Clear;
end;



end.

