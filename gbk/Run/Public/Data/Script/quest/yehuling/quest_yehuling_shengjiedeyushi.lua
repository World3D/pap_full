--ʥ�����ʯ

--MisDescBegin
x207003_g_ScriptId = 207003
x207003_g_MissionIdPre =3
x207003_g_MissionId = 4
x207003_g_MissionKind = 1
x207003_g_ScriptIdNext = {ScriptId = 207004 ,LV = 1 }
x207003_g_Name	="�����" 
x207003_g_Name2	="������" 

x207003_g_MissionName="ʥ�����ʯ"
x207003_g_MissionInfo="    Ҫ���Ǽ�ʶ����#Gľ����#W���������ҹ���#G����Ӫ#W���£��һ��벻��������ôһ���£����ǣ������ô˵�ء������Ӻ�˵���أ�\n \nʥ�����ʯ��������͸��һ���������ĵ����£���Ӧ�����ڴ�أ�#G����#W����������һ���¸�ΰ���Ů����\n \n���������ڣ������ۿ���������������Ů������ģ���ô������������ߵ��˵������أ�������������飬�㻹��ȥ����#G������#W��"  --��������
x207003_g_MissionTarget="    ����#G������#W������Ů��������"		
x207003_g_MissionComplete="    �߸����ϵĳ����죬�������������飬һ�����������ɣ����Ѿ���Ӧ����Ҫ������˵ʲô�ˣ������������й¶��\n \n���������Ȼ���ˣ�Ҳ�ǳ������ּ�⣬�Ҿ͸�����һЩ���ֲ��������û������֪�������������ɡ�����"					--�������npc˵���Ļ�

x207003_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207003_g_RadioItemBonus={}

--MisDescEnd


--**********************************

--������ں���

--**********************************

function x207003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207003_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207003_g_Name2) then
                     	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207003_g_MissionName)
			AddText(sceneId,x207003_g_MissionComplete)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207003_g_MissionTarget) 
			AddMoneyBonus(sceneId, x207003_g_MoneyBonus)	
			EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x207003_g_ScriptId, x207003_g_MissionId)
		end
        elseif x207003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207003_g_MissionName)
                AddText(sceneId,x207003_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207003_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207003_g_ScriptId, x207003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207003_g_ScriptId, x207003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207003_CheckPushList(sceneId, selfId, targetId)
        if IsMissionHaveDone(sceneId, selfId, x207003_g_MissionIdPre) > 0 then
        	if (GetName(sceneId,targetId)==x207003_g_Name) then
        	        if IsHaveMission(sceneId,selfId, x207003_g_MissionId)<= 0 then
        	            return 1
        	        end
        	elseif (GetName(sceneId,targetId)==x207003_g_Name2) then
			    if IsHaveMission(sceneId,selfId, x207003_g_MissionId) > 0 then
			    return 1
        	            end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207003_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207003_g_MissionId, x207003_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x207003_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x207003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207003_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207003_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207003_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207003_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207003_g_MissionId)
		AddExp(sceneId, selfId, x207003_g_ExpBonus)
		AddMoney(sceneId, selfId, x207003_g_MoneyBonus)
		for i, item in x207003_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        CallScriptFunction( x207003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207003_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207003_OnItemChanged(sceneId, selfId, itemdataId)

end

