unit uCondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin, Buttons, ComCtrls;

type
  TfrmCondition = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    YJH: TSpinEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    SpinEdit2: TSpinEdit;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    MJH: TSpinEdit;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
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

uses uEMPInfo;

{$R *.dfm}

procedure TfrmCondition.BitBtn2Click(Sender: TObject);

begin

 ModalResult:=mrOK;

end;

end.
