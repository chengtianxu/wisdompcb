unit mad;

interface
//qry_adoqry
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons,DB;

type
  Tfm_mad = class(TForm)
    btn_close: TBitBtn;
    btn_save: TBitBtn;
    Label1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    dbedtunit_code: TDBEdit;
    dbedtunit_code1: TDBEdit;
    dbedtunit_name: TDBEdit;
    dbchkprod: TDBCheckBox;
    dbchkpurch: TDBCheckBox;
    dbchkstock: TDBCheckBox;
    dbchkquote: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btn_closeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_mad: Tfm_mad;

implementation

uses demo;

{$R *.dfm}

procedure Tfm_mad.FormCreate(Sender: TObject);
begin
  KeyPreview:=true;
end;

procedure Tfm_mad.btn_saveClick(Sender: TObject);
begin
//    dbedtunit_code.text:=dbedtunit_code1.Text;
//    DM.qry_adoqry.FieldValues['unit_code']:= dbedtunit_code1.text;
//    DM.qry_adoqry.FieldValues['unit_name']:= dbedtunit_name.text;
//    dm.strngfldADS02unit_code.Value := dbedtunit_code1.text;
//    dm.strngfldADS02unit_name.Value := dbedtunit_name.text;
//    dm.dsADS02.Post;


    if (Trim(dbedtunit_code1.Text) <> '') and (Trim(dbedtunit_name.text) <> '') then
       begin
         try
           DM.dsADS02.Post;            //提交数据
           Self.ModalResult := mrok;    //"Self"指本窗体
         except     //当出现异常视为数据重复
           MessageBox(Handle,'单位重复，无法提交','警告',MB_ICONEXCLAMATION+MB_OK);
           Abort;                   //终止
         end;
       end

    else

     MessageBox(Handle,'单位代码或单位名称不允许为空！请重新输入','提示',MB_ICONINFORMATION+MB_OK)
end;

procedure Tfm_mad.FormCloseQuery(Sender: TObject; var CanClose: Boolean);     //当"X "按钮被点击触发的事件
begin
       if Self.ModalResult <> mrok then
        begin
          if MessageBox(Handle, '不保存退出吗?', '请确认', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
              begin
                  CanClose := true;
                  DM.dsADS02.Cancel;

              end
          else
                  CanClose := false;
        end
   else

end;

procedure Tfm_mad.btn_closeClick(Sender: TObject);
begin
     Self.ModalResult := mrCancel;
end;

end.
