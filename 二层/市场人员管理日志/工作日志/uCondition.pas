unit uCondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin, Buttons, ComCtrls;

type
  TfrmCondition = class(TForm)
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    YJH: TSpinEdit;
    SpinEdit1: TSpinEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    MJH: TSpinEdit;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    _SearchStr:string;
    _ZYStatus:integer;//职位(0无,1跟单员,2业务员,3营销员,4开发副总)
    _userptr:string;  //创建人
    _BMRKY:integer;   //部门
  end;

var
  frmCondition: TfrmCondition;

implementation


{$R *.dfm}

procedure TfrmCondition.BitBtn2Click(Sender: TObject);

begin
 if yjh.Value>self.SpinEdit1.Value then
  messagedlg('开始年度不能大于结束年度!',mterror,[mbcancel],0)
 ELSE
  if mjh.Value>self.SpinEdit2.Value then
   messagedlg('开始月份不能大于结束月份!',mterror,[mbcancel],0)
 else
 ModalResult:=mrOK;

end;

end.
