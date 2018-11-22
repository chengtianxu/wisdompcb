unit UpdateLZDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, damo, frm_main_u,IBQuery, ADODB;

type
  TFrmUpdateLZDate = class(TForm)
    lb_code: TLabel;
    lb_dept: TLabel;
    dbt_dept: TDBEdit;
    dbt_code: TDBEdit;
    dbt_alt: TDBEdit;
    lb_oper: TLabel;
    lb_1: TLabel;
    chinesename: TDBEdit;
    lb_11: TLabel;
    dtp1: TDateTimePicker;
    bbt_1: TBitBtn;
    bbt_2: TBitBtn;
    lb_alt: TLabel;
    dbt_ondutytime: TDBEdit;
    lb_3: TLabel;
    cbb_LZtype: TComboBox;
    lb_4: TLabel;
    cbb_LZrs: TComboBox;
    dbedtremark: TDBEdit;
    Label1: TLabel;
    procedure bbt_1Click(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUpdateLZDate: TFrmUpdateLZDate;

implementation

{$R *.dfm}

procedure TFrmUpdateLZDate.bbt_1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmUpdateLZDate.bbt_2Click(Sender: TObject);
begin
  if messagedlg('你确定要将员工 '+ chinesename.Text +' 的离职日期修改为 '
  + DateTimeToStr(dtp1.DateTime )+#13+' 离职类型为 【'+ cbb_LZtype.Text +'】  '
  +#13+' 离职原因为 【'+ cbb_LZrs.Text +'】 吗？'  , mtconfirmation, [mbyes,mbno],1) = mryes then
  begin
    dm.qry_info.Edit;
    dm.qry_info.fieldByName('alterdate').AsDateTime := dtp1.DateTime ;
    dm.qry_info.fieldByName('orginal_outdutytime').AsDateTime := dtp1.DateTime ;
    dm.qry_info.fieldbyname('oper_person').AsInteger:= strtoint(dm.data05_rkey) ;
    dm.qry_info.fieldbyname('oper_date').AsDateTime:=now;
    dm.qry_info.fieldbyname('type').AsInteger:=integer(cbb_LZtype.Items.Objects[cbb_LZtype.ItemIndex]);
    dm.qry_info.fieldbyname('reason').AsInteger:=integer(cbb_LZrs.Items.Objects[cbb_LZrs.ItemIndex]);
    close;
    dm.qry_info.Post;
    dm.qry_info.UpdateBatch();
    ShowMessage('修改成功！');
    dm.qry_info.Close;
    dm.qry_info.Open;     
  end;
end;

procedure TFrmUpdateLZDate.FormShow(Sender: TObject);
var i :Integer;
begin
  i := 0;
dtp1.Date := dm.qry_info.fieldByName('alterdate').AsDateTime;

// 获取离职原因
  with dm.qry_detail do
  begin
    //打开连接
    open;
    filter := 'dictid=10';
    filtered := true;
    first;
    cbb_LZrs.Items.Clear;
    cbb_LZrs.DropDownCount := 0;
    while not eof do
    begin
      cbb_LZrs.DropDownCount := cbb_LZrs.DropDownCount+1;
      cbb_LZrs.Items.AddObject(fieldbyname('item').asstring, Tobject(fieldbyname('rkey').AsInteger));
      if dm.qry_info.fieldByName('reason').AsInteger = dm.qry_detail.fieldbyname('rkey').AsInteger
      then   cbb_LZrs.ItemIndex := i;
      i := i +1;
      next;
    end;
    Close;
    Open;
    //获取雇佣类型
    i := 0;
    filter:='dictid=9';
    filtered := true;
    first;
    cbb_lztype.Items.Clear;
    cbb_lztype.DropDownCount := 0;
    while not eof do
    begin
      cbb_lztype.DropDownCount := cbb_lztype.DropDownCount+1;
      cbb_lztype.Items.AddObject(fieldbyname('item').asstring, tobject(fieldbyname('rkey').AsInteger));
      if dm.qry_info.fieldByName('type').AsInteger = dm.qry_detail.fieldbyname('rkey').AsInteger
      then   cbb_lztype.ItemIndex := i;
      i := i +1;
      next;
    end; 
    //关闭连接    
    close;
  end;
end;

end.
