unit mad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask;

type
  Tfm_mad = class(TForm)
    btb_close: TBitBtn;
    btb_save: TBitBtn;
    ded_display: TDBEdit;
    ded_code: TDBEdit;
    ded_name: TDBEdit;
    dcb_pro: TDBCheckBox;
    dcb_pur: TDBCheckBox;
    dcb_save: TDBCheckBox;
    dcb_sell: TDBCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btb_saveClick(Sender: TObject);
    procedure btb_closeClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_mad: Tfm_mad;

implementation

uses units,demo;

{$R *.dfm}

procedure Tfm_mad.btb_saveClick(Sender: TObject);
begin
  if (Trim(ded_code.Text) <> '') or (Trim(ded_name.text) <> '') then
            Self.ModalResult := mrok
        else
            ShowMessage('单位代码或单位名称不允许为空！请重新输入');
end;

procedure Tfm_mad.btb_closeClick(Sender: TObject);
begin
        Self.ModalResult := mrCancel;
end;

procedure Tfm_mad.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Self.ModalResult <> mrok then
        begin
          if MessageBox(Handle, '不保存退出吗?', '请确认', MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDYES then
              begin
                  CanClose := true;
                  fm_demo.qry_adoqry.Cancel;
              end
          else
                  CanClose := false;
        end
   else  
                  fm_demo.qry_adoqry.Post;



end;

end.
