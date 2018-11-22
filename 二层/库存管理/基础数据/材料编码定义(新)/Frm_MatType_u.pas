unit Frm_MatType_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFrm_MatType = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn6: TBitBtn;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MatType: TFrm_MatType;

implementation
 uses damo,common,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_MatType.BitBtn6Click(Sender: TObject);
  var InputVar: PDlgInput ;
var s:string;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields :='group_name/类别代码/100,group_desc/类别名称/150,inv_group_desc/性质/100';
    InputVar.Sqlstr :='select data0496.group_name,data0496.group_desc,data0496.mask_inv_number,Data0019.inv_group_name,Data0019.inv_group_desc,data0496.rkey,data0496.if_flag '+
                      'from data0496 inner join data0019 on '+
                      'Data0019.rkey = Data0496.group_ptr';
    inputvar.KeyField:='group_name';

    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['group_name']);
      label5.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['group_desc']);
      Edit3.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      if  frmPick_Item_Single.adsPick.Fieldbyname('if_flag').AsInteger=0 then //作为mask
      begin
        MaskEdit1.EditMask:='';
        MaskEdit1.Text:='';
        MaskEdit1.EditMask:=frmPick_Item_Single.adsPick.Fieldbyname('mask_inv_number').AsString;
      end else begin    //作为初始值
        s:=MaskEdit1.Text;
        MaskEdit1.EditMask:='';
        MaskEdit1.Text:=trim(s);
      end;
      MaskEdit1.SetFocus;
    end ;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_MatType.BitBtn1Click(Sender: TObject);
begin
  if MaskEdit1.Text='' then
  begin
    showmessage('物料编码不能为空');
    exit;
  end;
 { if Edit1.Text='' then
  begin
    showmessage('物料名称不能为空');
    exit;
  end;
  if Edit2.Text='' then
  begin
    showmessage('物料规格不能为空');
    exit;
  end; }
  if Edit3.Text='' then
  begin
    showmessage('物料类别不能为空');
    exit;
  end;
  modalresult:=mrok;
end;

end.
