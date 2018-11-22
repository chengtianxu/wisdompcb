unit UModiOutTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask, DBCtrls;

type
  TFrmModiOutTime = class(TForm)
    lb_code: TLabel;
    lb_dept: TLabel;
    lb_oper: TLabel;
    lb_1: TLabel;
    lb_11: TLabel;
    lb_alt: TLabel;
    lb_3: TLabel;
    lb_4: TLabel;
    Label1: TLabel;
    dbt_dept: TDBEdit;
    dbt_code: TDBEdit;
    dbt_alt: TDBEdit;
    chinesename: TDBEdit;
    dtp1: TDateTimePicker;
    bbt_1: TBitBtn;
    bbt_2: TBitBtn;
    dbt_ondutytime: TDBEdit;
    cbb_LZtype: TComboBox;
    cbb_LZrs: TComboBox;
    dbedtremark: TDBEdit;
    procedure bbt_1Click(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmModiOutTime: TFrmModiOutTime;

implementation

uses UMain, UDM;

{$R *.dfm}

procedure TFrmModiOutTime.bbt_1Click(Sender: TObject);
begin
close;
end;

procedure TFrmModiOutTime.bbt_2Click(Sender: TObject);
begin
  if messagedlg('你确定要将员工 '+ chinesename.Text +' 的离职日期修改为 '
  + DateTimeToStr(dtp1.DateTime )+#13+' 离职类型为 【'+ cbb_LZtype.Text +'】  '
  +#13+' 离职原因为 【'+ cbb_LZrs.Text +'】 吗？'  , mtconfirmation, [mbyes,mbno],1) = mryes then
  begin
    FrmMain.qry_pre.Edit;
    FrmMain.qry_pre.fieldByName('alterdate').AsDateTime := dtp1.DateTime ;
    FrmMain.qry_pre.fieldByName('orginal_outdutytime').AsString := FormatDateTime('YYYY-MM-DD', dtp1.DateTime );
    FrmMain.qry_pre.fieldbyname('oper_person').AsInteger:= strtoint(dm.data05_rkey) ;
    FrmMain.qry_pre.fieldbyname('oper_date').AsDateTime:=now;
    FrmMain.qry_pre.fieldbyname('type').AsInteger:=integer(cbb_LZtype.Items.Objects[cbb_LZtype.ItemIndex]);
    FrmMain.qry_pre.fieldbyname('reason').AsInteger:=integer(cbb_LZrs.Items.Objects[cbb_LZrs.ItemIndex]);
    close;
    FrmMain.qry_pre.Post;
    FrmMain.qry_pre.UpdateBatch();
    ShowMessage('修改成功！');
    FrmMain.qry_pre.Requery;    
  end;
end;

procedure TFrmModiOutTime.FormShow(Sender: TObject);
var i :Integer;
begin
  i := 0;
dtp1.Date := FrmMain.qry_pre.fieldByName('alterdate').AsDateTime;

// 获取离职原因
  with dm.qry_detail do
  begin
    //打开连接
    open;
    filter := 'dictid=10 and user_defined1= 1';
    filtered := true;
    first;
    cbb_LZrs.Items.Clear;
    cbb_LZrs.DropDownCount := 0;
    while not eof do
    begin
      cbb_LZrs.DropDownCount := cbb_LZrs.DropDownCount+1;
      cbb_LZrs.Items.AddObject(fieldbyname('item').asstring, Tobject(fieldbyname('rkey').AsInteger));
      if FrmMain.qry_pre.fieldByName('reason').AsInteger = dm.qry_detail.fieldbyname('rkey').AsInteger
      then   cbb_LZrs.ItemIndex := i;
      i := i +1;
      next;
    end;
    Close;
    Open;
    //获取雇佣类型
    i := 0;
    filter:='dictid=9 and user_defined1= 1';
    filtered := true;
    first;
    cbb_lztype.Items.Clear;
    cbb_lztype.DropDownCount := 0;
    while not eof do
    begin
      cbb_lztype.DropDownCount := cbb_lztype.DropDownCount+1;
      cbb_lztype.Items.AddObject(fieldbyname('item').asstring, tobject(fieldbyname('rkey').AsInteger));
      if FrmMain.qry_pre.fieldByName('type').AsInteger = dm.qry_detail.fieldbyname('rkey').AsInteger
      then   cbb_lztype.ItemIndex := i;
      i := i +1;
      next;
    end; 
    //关闭连接    
    close;
  end;

end;

end.
